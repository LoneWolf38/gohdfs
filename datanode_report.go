package hdfs

import (
	"fmt"

	hdfs "github.com/colinmarc/hdfs/v2/internal/protocol/hadoop_hdfs"
)

// GetDatanodeReport fetches the datanode storage reports
func (c *Client) GetDataNodeReport() error {
	req := &hdfs.GetDatanodeStorageReportRequestProto{
		Type: hdfs.DatanodeReportTypeProto_ALL.Enum(),
	}
	resp := &hdfs.GetDatanodeStorageReportResponseProto{}

	err := c.namenode.Execute("getDatanodeStorageReport", req, resp)
	if err != nil {
		fmt.Println(err.Error())
		return err
	}
	if resp.GetDatanodeStorageReports() == nil {
		return fmt.Errorf("no datanode storage report found")
	}

	reports := resp.GetDatanodeStorageReports()
	for _, report := range reports {
		fmt.Println(report.GetDatanodeInfo())
		fmt.Println(report.GetDatanodeInfo())
		srs := report.GetStorageReports()
		for _, sr := range srs {
			sr.GetStorage().GetStorageType()
		}
	}

	return nil
}
