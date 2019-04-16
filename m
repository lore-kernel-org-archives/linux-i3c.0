Return-Path: <SRS0=s+0C=SS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A223CC282E1
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 04:42:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 741BE2075B
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 04:42:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XY5qVby0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="hSRNzFFr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="HIWmhciR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 741BE2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qu2TLGrHLK4qfxnK13H5YLEqGV8YqX6fkwSINqd5/Z4=; b=XY5qVby0HbBlOE
	DgWbDvxu2Ob2gCvTmOelx37vwHG7sP5q9/YAQe1UhUzHeXXmpN3i8TCjgzJNga4AGgFkjllEW5LfL
	fEhAgsiZHX0XP9JOhH5GSsGrreAt+UFvHCPr1HbVBriRBYmrcFsA+mSc7s3N/5NQWC/Z2YkfHP1jO
	HBRDAjDjG44lAdUx2Y52MTZxaW+oDdwvRzqHf4ENsRh+egFjlrRP3U6aUPoz4FKHvYc1qhEIgjp5O
	SteCYJcE+33ZMnXomcMAyQO4wyvc6+CkDXK9K8ge9UqV/fKsTnHbseHQ8Lt4+zAiq/hCqgYBeZV4G
	BzpSO1p465n5KotUSHtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGFvG-00087l-SX; Tue, 16 Apr 2019 04:42:18 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGFvB-00085m-Ju
 for linux-i3c@lists.infradead.org; Tue, 16 Apr 2019 04:42:16 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3G4bMTQ016548; Mon, 15 Apr 2019 21:42:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=+JSFMwcfmr50M3wJ7f4WptR5F6HEeH3hMyURqQGvdeM=;
 b=hSRNzFFrUGz18xUZDAiUt5BdpjfkZ+EQtJdd6d+IHpOf6xXhU5zdaxxU6ngSARtLJitR
 KL2fKqf6CfLVKg+/pfOL2aTZAcgpOxpBFwju5N0ot7FYX0U1iFBBoPgZFqeAxdENeWvu
 UWSsBLpo1v9Dxi6WH9b/5J8VFUdRG0J10fbA8hG8jqe6Z77+rQiUzHu8EchaCd4EOE33
 2/lDvfQ4AubARq0BeyrpfZ177QpQT8WoZXIF4XvAcc42764xiUs0VCzbNVjI/S6xf+GL
 +Ds7W8mw81TtBPe4+MKT0PMDPupmLtm9Y8Jdujgvr9+i6neg4ZIHnoFyNX3Fi9XwwpSV UA== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam01-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam01lp2054.outbound.protection.outlook.com [104.47.32.54])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2rw74gr93s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 15 Apr 2019 21:42:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JSFMwcfmr50M3wJ7f4WptR5F6HEeH3hMyURqQGvdeM=;
 b=HIWmhciRldO1CKkHVu+GccqDdz8YlBKejYXJUh/J3rzJrQjJS/Hvw7iIQA4/vuywYRRuJ3d4o2dtf+c6BAVkyG/0jbE9iz1OFI7vRUcCjyn9i4oLSQgLDxp8jm0ESk3kIpCKFXG1EO0a7e+TlBt0/72aoFjALqJVZI/5Oe9dRsY=
Received: from DM5PR07CA0069.namprd07.prod.outlook.com (2603:10b6:4:ad::34) by
 SN1PR07MB4109.namprd07.prod.outlook.com (2603:10b6:802:30::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.17; Tue, 16 Apr 2019 04:42:03 +0000
Received: from CO1NAM05FT048.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::206) by DM5PR07CA0069.outlook.office365.com
 (2603:10b6:4:ad::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1792.15 via Frontend
 Transport; Tue, 16 Apr 2019 04:42:03 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 CO1NAM05FT048.mail.protection.outlook.com (10.152.96.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1792.7 via Frontend Transport; Tue, 16 Apr 2019 04:42:01 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x3G4fuQS002971
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 16 Apr 2019 00:41:59 -0400
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 16 Apr 2019 06:41:58 +0200
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 16 Apr 2019 06:41:58 +0200
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x3G4fv5s003578;
 Tue, 16 Apr 2019 05:41:57 +0100
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x3G4fvlU003577;
 Tue, 16 Apr 2019 05:41:57 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v4 1/4] i3c: master: cdns: Drop support for I2C 10 bit
 addresing in Cadence I3C master
Date: Tue, 16 Apr 2019 05:41:43 +0100
Message-ID: <20190416044146.2382-2-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190416044146.2382-1-pgaj@cadence.com>
References: <20190416044146.2382-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(376002)(396003)(136003)(2980300002)(199004)(189003)(36092001)(53936002)(107886003)(26005)(356004)(6666004)(476003)(50226002)(4326008)(86362001)(54906003)(16586007)(5660300002)(97736004)(316002)(446003)(426003)(105596002)(36756003)(186003)(11346002)(486006)(2616005)(76130400001)(336012)(478600001)(87636003)(126002)(8936002)(50466002)(8676002)(76176011)(6916009)(51416003)(14444005)(81166006)(48376002)(81156014)(2906002)(42186006)(5024004)(47776003)(2351001)(1076003)(69596002)(26826003)(106466001)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR07MB4109; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:ErrorRetry; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d2bcd78-6fea-474c-315b-08d6c225de16
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:SN1PR07MB4109; 
X-MS-TrafficTypeDiagnostic: SN1PR07MB4109:
X-Microsoft-Antispam-PRVS: <SN1PR07MB4109AD26B4A295D10E9BC691C2240@SN1PR07MB4109.namprd07.prod.outlook.com>
X-Forefront-PRVS: 000947967F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: OozFcT17LeEUd5gzD46vUQ7gICS6MBG/MtnsfkLroYCvFYidYkVQcECXhs2iKUUFcH8MIHPnvjfyIHqykjhR1gN3Gpr3i+culXgOY3iyWHGgOeKoTUrp4CYWNRNArhWkVmoDa5fcfBfSRzKwhUWBwbdfH4sEmgt7MnpbB+JVwh/44MujO6dMS+s8iNaUWOyocY2FHOFXMQFHAf3EyKkIJpY3KcvOuzVMyCVI/p5NVsBIlFaQK8AdrcXxlR81SvuSlzwZqvjfpA28umcPGUI7E53fR4caVLaPI7gWhh0mngz7bLyArfvOc3M+RkZQDYeFBMYGH8UA4drdG0Tul9jHWkcM0AZPEjxQr9iInS3V/J/a742MXadkJwE1SmBCG9GppgFDWYh7BWiRSHmWru3UiWaMYNe1hoZINA+cOzF+H50=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2019 04:42:01.2016 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d2bcd78-6fea-474c-315b-08d6c225de16
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR07MB4109
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp
 include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-16_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=620 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904160033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_214213_796400_9762B6B3 
X-CRM114-Status: GOOD (  11.30  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, agolec@cadence.com,
 Przemyslaw Gaj <pgaj@cadence.com>, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Because this patch series dropped support for 10 bit I2C devices, support is
also dropped in Cadence I3C master driver.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>

---

Main changes between v2 and v3 are:
- Remove i2c_funcs() hook implementation.
---
 drivers/i3c/master/i3c-master-cdns.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 8889a4f..237f24a 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -864,11 +864,6 @@ static int cdns_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 	return ret;
 }
 
-static u32 cdns_i3c_master_i2c_funcs(struct i3c_master_controller *m)
-{
-	return I2C_FUNC_SMBUS_EMUL | I2C_FUNC_I2C | I2C_FUNC_10BIT_ADDR;
-}
-
 struct cdns_i3c_i2c_dev_data {
 	u16 id;
 	s16 ibi;
@@ -1010,9 +1005,7 @@ static int cdns_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
 	master->free_rr_slots &= ~BIT(slot);
 	i2c_dev_set_master_data(dev, data);
 
-	writel(prepare_rr0_dev_address(dev->boardinfo->base.addr) |
-	       (dev->boardinfo->base.flags & I2C_CLIENT_TEN ?
-		DEV_ID_RR0_LVR_EXT_ADDR : 0),
+	writel(prepare_rr0_dev_address(dev->boardinfo->base.addr),
 	       master->regs + DEV_ID_RR0(data->id));
 	writel(dev->boardinfo->lvr, master->regs + DEV_ID_RR2(data->id));
 	writel(readl(master->regs + DEVS_CTRL) |
@@ -1518,7 +1511,6 @@ static const struct i3c_master_controller_ops cdns_i3c_master_ops = {
 	.send_ccc_cmd = cdns_i3c_master_send_ccc_cmd,
 	.priv_xfers = cdns_i3c_master_priv_xfers,
 	.i2c_xfers = cdns_i3c_master_i2c_xfers,
-	.i2c_funcs = cdns_i3c_master_i2c_funcs,
 	.enable_ibi = cdns_i3c_master_enable_ibi,
 	.disable_ibi = cdns_i3c_master_disable_ibi,
 	.request_ibi = cdns_i3c_master_request_ibi,
-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
