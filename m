Return-Path: <SRS0=s+0C=SS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4115EC10F13
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 04:42:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F53F2075B
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 04:42:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UcKygBvD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="l+w493hX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="TPLmlDB9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F53F2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=42m3lw9vq0ZHef6I578/cyQBmLgKdYdWYr+m/P2bpV8=; b=UcKygBvDe0NSUY
	hH0aj+pvaWICUa9nz7Qn+5gB3f1Z71AIDeYq46QqCHNrLXVkrJQGlFQUAbTYkr8VaVi15OsR26CIE
	O5h9fRFLjQp96MbOJLPY3Mh16eKsF/5lkv25ug8fr47G1Oi0A3Y9Mmq7UA6Za3bBbf6Y38DodCX1C
	xHbetVHoCO9Ll4ObYThFmwlOq+RDDLdTxLcQU2/zvhr+UgT5/H5K/Bd1Sn9qtqKqcIYqCZpdiwebD
	49MuKL91h515L314B303Gv7e58l3zYCgVfu9Ls+CqnKw4tflAMFDlK5UUxTTRXoMiMR2zeF4TKbJ0
	joYulUulTxjmCQriDi8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGFvE-00087B-J9; Tue, 16 Apr 2019 04:42:16 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGFvB-00085n-Hd
 for linux-i3c@lists.infradead.org; Tue, 16 Apr 2019 04:42:15 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3G4b295016451; Mon, 15 Apr 2019 21:42:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=iXcjCIyR+I5SxaSkc0yCUBbklPT8mgOTx8o7/XqEajE=;
 b=l+w493hX/7m0zU7O7ggkSyMQPxSqGHghO0H1ShjxlGUxeIJFIpxAkmFtt9pX0gJLaI4r
 lOp3quhSP4sC5S8zPTSpuEMe5xPcptDgAjVwD0nTS2eovK7/VPnC8PAH6mEyhWvybHIg
 klQbjj/TFGJdIsidBx9pXFRMIytvXn4GwyNtmc4YrIkYRpOiw+FixH+T9pJdLQmcDoUz
 1OH2Pu2W1WPnNLUjfnCuykz7sG/jRJ9NGIudxD49133aewponpj5sdraLhp96LAWAeQm
 Yh62rLyaYMqL93jUEh4GxyiNXjPNVzRWLJpbPkBLtMGCr1h4fm29wsfM3O5Mdz0f2xab wA== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam03-by2-obe.outbound.protection.outlook.com
 (mail-by2nam03lp2059.outbound.protection.outlook.com [104.47.42.59])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2rw74gr93q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 15 Apr 2019 21:42:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXcjCIyR+I5SxaSkc0yCUBbklPT8mgOTx8o7/XqEajE=;
 b=TPLmlDB9y3jR5L7LyBHrl+ovujNDFI+ovPXNT0x2QHohKOOkVTklf7+vez62uuAN3tGCpVFc9O8jVNdS6H1VJrp290PXxqrQKD2do5GnvEZUIhR8kHpAZXIkAgYhUDJg0HPhu/4Vo/zBmFNS89XJi6zPnexNKYc8/Bu9cJONec8=
Received: from SN4PR0701CA0005.namprd07.prod.outlook.com
 (2603:10b6:803:28::15) by BN8PR07MB5812.namprd07.prod.outlook.com
 (2603:10b6:408:68::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1792.19; Tue, 16 Apr
 2019 04:42:03 +0000
Received: from DM3NAM05FT055.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::205) by SN4PR0701CA0005.outlook.office365.com
 (2603:10b6:803:28::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1813.11 via Frontend
 Transport; Tue, 16 Apr 2019 04:42:03 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 DM3NAM05FT055.mail.protection.outlook.com (10.152.98.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1792.7 via Frontend Transport; Tue, 16 Apr 2019 04:42:02 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x3G4g0pe030122
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 15 Apr 2019 21:42:01 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 16 Apr 2019 06:42:00 +0200
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 16 Apr 2019 06:42:00 +0200
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x3G4fxpv003623;
 Tue, 16 Apr 2019 05:41:59 +0100
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x3G4fxwF003619;
 Tue, 16 Apr 2019 05:41:59 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v4 2/4] i3c: master: dw-i3c-master: Remove i2c_funcs hook
 implementation
Date: Tue, 16 Apr 2019 05:41:44 +0100
Message-ID: <20190416044146.2382-3-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190416044146.2382-1-pgaj@cadence.com>
References: <20190416044146.2382-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(136003)(396003)(376002)(346002)(39860400002)(2980300002)(189003)(36092001)(199004)(8676002)(47776003)(356004)(486006)(336012)(126002)(2616005)(446003)(6666004)(186003)(316002)(107886003)(76176011)(54906003)(87636003)(16586007)(26005)(42186006)(4326008)(478600001)(86362001)(1076003)(426003)(476003)(11346002)(51416003)(305945005)(7636002)(5024004)(106466001)(2351001)(105596002)(2906002)(8936002)(50226002)(50466002)(36756003)(48376002)(6916009)(76130400001)(5660300002)(246002)(26826003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR07MB5812; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33a6d4f7-616e-45b4-e908-08d6c225df02
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BN8PR07MB5812; 
X-MS-TrafficTypeDiagnostic: BN8PR07MB5812:
X-Microsoft-Antispam-PRVS: <BN8PR07MB5812010228847B868141DFF3C2240@BN8PR07MB5812.namprd07.prod.outlook.com>
X-Forefront-PRVS: 000947967F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 264W5IugxF0AhahdfArKi8Bu7Adt0LJP+kNuoz3jZaTqymEgOZqU/vlbM/cH/8CdhOO9RQoW5UgwXIB4rjQ//TBD82us5oLfore6Ga9cJwmm7Q4xrmBzfYQIww55rgRvpPVawyAzQffwwgllBW1xwoqyW6POpaxQeErfXcoKrbWSiI73d5tWxXF7QK32nyCjqniBMPnA/W3p2kAq+SF/ZVJ8qy8e0ZFR6jHYsDU/fpOCPQlpqUAyDvl0bOIUEZTc5KiMdcRVm+5yyaGMDGpfZMZ5OVEPzL7us2/R039kGbSPfr+Gcvr1h6LdpnwvoFL5k7Klkz5UG+ONkixTjq4xHVJ1dVDMdE/faF9uk9i6qKlasrtugMbg1kWIwBmr6CQIrCvRornMxxjjTghCozN/lLccCJv13h2EjCRQcwvBUFY=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2019 04:42:02.7599 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a6d4f7-616e-45b4-e908-08d6c225df02
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR07MB5812
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
 priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=973 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904160033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_214213_695332_746B9722 
X-CRM114-Status: GOOD (  10.56  )
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

Because this patch series dropped support for 10 bit I2C devices, i2c_funcs()
hook has been removed. I removed hook implementation from Synopsys DesignWare
I3C master driver.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 drivers/i3c/master/dw-i3c-master.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index bb03079..9934a12 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1069,11 +1069,6 @@ static void dw_i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
 	kfree(data);
 }
 
-static u32 dw_i3c_master_i2c_funcs(struct i3c_master_controller *m)
-{
-	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
-}
-
 static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
 {
 	struct dw_i3c_master *master = dev_id;
@@ -1108,7 +1103,6 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
 	.attach_i2c_dev = dw_i3c_master_attach_i2c_dev,
 	.detach_i2c_dev = dw_i3c_master_detach_i2c_dev,
 	.i2c_xfers = dw_i3c_master_i2c_xfers,
-	.i2c_funcs = dw_i3c_master_i2c_funcs,
 };
 
 static int dw_i3c_probe(struct platform_device *pdev)
-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
