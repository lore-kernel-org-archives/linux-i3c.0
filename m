Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39E8C36008
	for <linux-i3c@archiver.kernel.org>; Wed, 26 Mar 2025 14:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VVrDSGYVM9ZOfjNvVFRKB4aZcWo1C+uSolsEwhZ44rA=; b=sPjqXoUqdpHduj
	GX4x0IHBeVv3rX4UgoqK7zqo9B+vYxkpWwT7lY+H432O4wucHGqb+S+8p73tvMZX/OPfObyEb8bKg
	qJQiujoyu2fYsVJobGBQ6mCVG75rYPE3+nsvlWks9PY2FCwwNkUMhAHpYy3KrwSnFTJYE9vHsBYL6
	/oFt+5bBtyqfA0r9rV6BSQu0nt6ZAOYj/RP2mz7JU7lLrYZDXsqla9XfJLNqK4y5RmDFpuXOp0q6k
	NGG6SHfJp1YsBRIb0t00YT6J8TKpSeD8wk8/q/kWV/mnUXI860s6CtN6CaY1r7q3SlT3Uo8BzcBME
	ysxanrg9tjr/xMYUZS7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRZg-00000008fCk-1mcl;
	Wed, 26 Mar 2025 14:17:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRZd-00000008fBe-2U7D
	for linux-i3c@lists.infradead.org;
	Wed, 26 Mar 2025 14:17:43 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q73XmL006819;
	Wed, 26 Mar 2025 14:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rEfrfle6P+tbGDZRFOhPeJQ12TYfKbo/Vwr
	VYSh0mHM=; b=MhlLYrHlI6tPXrHvqDNIjqJ3eJEXD3Q9NV7JixhS2OMeCmsPrFi
	AokJPTWD8S5BgLJGRmh5e+rg7vmF0wqrxe1rnMAnDJgASvA0iIFk+VwDtqkqbZf9
	X+mJimbIAd3YEE9vtSLArNSSX3GYO/7G6M2EiY4ngHIOMU2rQhnWVKyRYQHeVm8u
	DOEJ62PP8f7zTQaF2GUjE2AwDSAvvH2ljcMXd778nBFofSfTEgWx1y6O1MzyG6Vy
	gHjIc9iV5M4qadUQqSCMS6zP6vAgUwEaAH1qBtxapsKqzj5RubDp4OMvmex+Bqu0
	f/YazwX+m0PVGW65asxha0C8zr921W9ECew==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45k7qjf74q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 14:17:34 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52QEHV9e025684;
	Wed, 26 Mar 2025 14:17:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 45hp9mdsfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 14:17:31 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52QEHVDp025679;
	Wed, 26 Mar 2025 14:17:31 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 52QEHUgU025675
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 14:17:31 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id BD3082343B; Wed, 26 Mar 2025 19:47:29 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v2 0/3] Add Qualcomm i3c master controller driver support
Date: Wed, 26 Mar 2025 19:46:38 +0530
Message-Id: <20250326141641.3471906-1-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HfHidhlvta_4sPddPN0KeByV1WKRskuw
X-Proofpoint-GUID: HfHidhlvta_4sPddPN0KeByV1WKRskuw
X-Authority-Analysis: v=2.4 cv=feOty1QF c=1 sm=1 tr=0 ts=67e40c7e cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=swcVkCHeNRsN2Py2pQoA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_07,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_071741_661569_EB139BB3 
X-CRM114-Status: GOOD (  16.09  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

This patchset adds i3c controller support for the qualcomm's QUPV3 based 
Serial engine (SE) hardware controller. 

The I3C SE(Serial Engine) controller implements I3C master functionality
as defined in the MIPI Specifications for I3C, Version 1.0. 

This patchset was tested on Kailua SM8550 MTP device and data transfer
has been tested in I3C SDR mode.


Features tested and supported :
  Standard CCC commands.
  I3C SDR mode private transfers in PIO mode.
  I2C transfers in PIO mode.

Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
----
Link to v1: https://lore.kernel.org/lkml/20250205143109.2955321-1-quic_msavaliy@quicinc.com/

Changes in V3:
 - Removed bindings word from subject title of dt-bindings patch.
 - Use Controller name instead of Master as per MIPI alliance guidance and updated title.
 - Added description field for the i3c master into dt-bindings.
 - Changed title to "Qualcomm Geni based QUP I3C Controller".
 - Changed compatible to "qcom,i3c-master" matching dt-binding file and driver.
 - Changed "interrupts-extended" property to "interrupts" as suggested by krzysztof.
 - Dropped reg, clock minItems and added maxItems similar to other dt-bindings.
 - Removed clock-names property from dt-bindings suggested by Krzysztof, Bjorn.
 - Set "se-clock-frequency"  set it within drivers as suggested by Rob.
 - Removed "dfs-index" property and manage it within driver as suggested by Rob.
 - Removed "interrupts" maxItems as we need only 1 interrupt in this change.
 - Added comment for mutex lock mentioning purpose in sruct geni_i3c_dev .
 - Return with dev_err_probe() instead of error log and then return -ENXIO from probe().
 - Removed dev_dbg(&pdev->dev, "Geni I3C probed\n") print log as suggested by krzysztof.
 - Removed CONFIG_PM and else part around runtime PM operations following other drivers.
 - Removed Module alias MODULE_ALIAS("platform:geni_i3c_master").
 - Replaced MASTER with GENI in the Title of MAINTAINER file.
 - Removed duplications from the commit log and removed unwanted statement.
 - Formatted license and copyright similar to other files.
 - Removed SLV_ADDR_MSK and used FIELD_PREP/FIELD_GET instead of local bit shifting operations.
 - Used direct bit positions for each internal Error bit of DM_I3C_CB_ERR.
 - Removed Unused SLV_ADDR_MSK and added SLAVE_ADDR_MASK as GENMASK(15,9).
 - Renamed spinlock as irq_lock.
 - Removed dfs_idx from geni_i3c_dev and made it local inside qcom_geni_i3c_conf().
 - Use boolean cur_is_write instead of enum i3c_trans_dir/gi3c->cur_rnw.
 - Used DECLARE_BITMAP and related set/clear_bit APIs instead of manual operation.
 - Inline the error messages from geni_i3c_err_log directly to improve readability
   and avoid unnecessary jumps caused by the geni_i3c_err_code enum.
 - Converted clk_src_freq of struct geni_i3c_clk_settings to HZ.
 - Removed unwanted debug logs from geni_i3c_clk_map_idx().
 - clk_od_fld and itr renamed to clk_od_idx and clk_idx respectively to map actual usage.
 - Added se-clock-frequency to be read from DTSI, if none, then default to 100MHz source.
 - Changed Error log during bus_init() if OD and PP mode frequencies avaiable or not.
 - Used FIELD_PREP and standard BIT operations inside qcom_geni_i3c_conf() instead manual shifting.
 - Removed unnecessary parentheses from geni_i3c_irq().
 - Moved geni_se_abort_m_cmd() implementation to a new helper function geni_i3c_abort_xfer().
 - Removed unwanted reinitialization of cur_len, cur_idx, cur_rnw from _i3c_geni_execute_command().
 - Removed dev_dbg logs which were meant for developmental debug purpose.
 - Removed unnecessary check nxfers <= 0 from geni_i3c_master_priv_xfers().
 - Replaced devm_kzalloc() by kzalloc() inside geni_i3c_master_attach_i2c_dev() to use
   kfree() from counter function geni_i3c_master_detach_i2c_dev().
 - Replaced devm_kzalloc() by kzalloc() inside geni_i3c_master_attach_i3c_dev() to use
   kfree() from counter function geni_i3c_master_detach_i3c_dev().   
 - Removed geni_i3c_master_reattach_i3c_dev() function as default returns 0.
 - Removed goto label from geni_i3c_master_bus_init() by reorganizing internal code.
   Also used i3c_geni_runtime_get_mutex_lock()/unlock() instead of get_sync() similar to other places.
 - Added indent to fallthrough for switch cases inside geni_i3c_master_supports_ccc_cmd().
 - Renamed i3c_geni_rsrcs_init() to i3c_geni_resources_init().
 - Changed devm_ioremap_resource() to devm_platform_ioremap_resource(), removed platform_get_resource().
 - Replaced dev_err() with dev_err_probe() for core clock named se-clk.
 - Removed development debug prints for votings from gi3c->se.icc_paths.
 - Probe(): Changed all dev_err() to dev_error_probe() with proper log messages.
 - Probe(): Moved static resource allocation immediately after gi3c object allocation.
 - Probe(): Disabled PM if i3c master registration fails during probe().
 - Remove(): Unregister master first and then added Disable of PM as opposite to probe().
 - Removed I3C_CCC_ENTHDR support as it's not supported.
---
Mukesh Kumar Savaliya (3):
  dt-bindings: i3c: Add Qualcomm I3C master controller
  i3c: master: Add Qualcomm I3C controller driver
  MAINTAINERS: Add maintainer for Qualcomm's I3C driver

 .../bindings/i3c/qcom,i3c-master.yaml         |   60 +
 MAINTAINERS                                   |    8 +
 drivers/i3c/master/Kconfig                    |   12 +
 drivers/i3c/master/Makefile                   |    1 +
 drivers/i3c/master/qcom-i3c-master.c          | 1107 +++++++++++++++++
 5 files changed, 1188 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
 create mode 100644 drivers/i3c/master/qcom-i3c-master.c

-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
