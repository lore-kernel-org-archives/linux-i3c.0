Return-Path: <SRS0=nyfO=QZ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAD_ENC_HEADER,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC4BC10F01
	for <linux-i3c@archiver.kernel.org>; Mon, 18 Feb 2019 13:13:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2110C21848
	for <linux-i3c@archiver.kernel.org>; Mon, 18 Feb 2019 13:13:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rOE3b4gt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="TwJWaQBT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="mZj4En+N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2110C21848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iC6txwKudiS1IlQE79n3qEF3R0TPDZ1TRtK2QpGWsLg=; b=rOE3b4gtxwy/CF
	25RCO6ry5RSGouZrkcr4QNBQ9w3QKlL8C3C/PvfnCDaPY1HUKHMocpGY1rAvpgPosHknCVGItLIch
	R2OGUuCj+Fz5/5K+mguucT5Jq3EDPNqjiHuS64SIIaJwsduU1d3/onbEKglWEfHOU14ds3pwpElfJ
	R6CdTM9yFkmQtDIBrfl5F6ntEDGL72ynLZGPryzZcYkLDIvseTKs5htSGcNgWY1eDE6hZrPGyLTsj
	FEWVaCpgFJ5gJ6uMKqFjp3R8K9U5/Utu7hliTAT8W9b4iwKWuKInfkoNLxIk+yHKwE6qycX/HF4ln
	fSc//PUdIkzBiiMTDXng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvijO-0001Zz-Kh; Mon, 18 Feb 2019 13:13:10 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvijL-0001YP-Fv
 for linux-i3c@lists.infradead.org; Mon, 18 Feb 2019 13:13:09 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1ID4AGa008354; Mon, 18 Feb 2019 05:13:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=pgyyqGH+jyZ1fXlWX43fdn7+vnBsDwSIdStv7ujpnQo=;
 b=TwJWaQBTRkYJgIDKX07QU0Y/TSaQfLQyEkh+mHCkAAuhJGNsfYuWpPz//03nxgYc9+to
 Adta8KLsXCO5qeDlfjUEiNpDGRvhdh+Ci3pgKpao3Xd+0J9SDcOgjYIdLRX0hsFQZwDc
 iytQSm5XPQxU7ex15kXshS7UBPc6icZJpgiEW7LxFBrzzrwEdQakwyLZCKmSU5v41yki
 6L3rh+XH7eEbUVccKhSSFsPuMNllABBMo36t5lIw/s2ne5EUyq4eLHAjEC3ZM8PsZtBQ
 8xwk2Bu9ePAMRR99vw4mCvfiLSQJFMZBB8psapNIsMIQAv93FCcJq974H30FpA+k+BsD bA== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam05-co1-obe.outbound.protection.outlook.com
 (mail-co1nam05lp2056.outbound.protection.outlook.com [104.47.48.56])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2qpeyy8uaj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Feb 2019 05:13:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgyyqGH+jyZ1fXlWX43fdn7+vnBsDwSIdStv7ujpnQo=;
 b=mZj4En+NTfKql/vuJUgt5pR+PCqEACVk4aLsgCiMX809Vr2VIRoi0wftScKlVJfSD9FakElHCAIu2X7HeD20I1MEU72/9mW44Dt588SdXocnvOdqnIPPk/DeAbxTrDgi6Zmxf7ZWA0c+ExYSfuf5pALKCkwbIIxvdTmns59LFBg=
Received: from BN8PR07CA0017.namprd07.prod.outlook.com (2603:10b6:408:ac::30)
 by CY1PR07MB2246.namprd07.prod.outlook.com (2a01:111:e400:5a10::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1622.16; Mon, 18 Feb
 2019 13:13:02 +0000
Received: from BY2NAM05FT009.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::203) by BN8PR07CA0017.outlook.office365.com
 (2603:10b6:408:ac::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1622.16 via Frontend
 Transport; Mon, 18 Feb 2019 13:13:01 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 BY2NAM05FT009.mail.protection.outlook.com (10.152.100.146) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.11 via Frontend Transport; Mon, 18 Feb 2019 13:13:01 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x1IDCuZ9019867
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 18 Feb 2019 05:13:00 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Mon, 18 Feb 2019 14:12:56 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Mon, 18 Feb 2019 14:12:56 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x1IDCusb001268;
 Mon, 18 Feb 2019 13:12:56 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x1IDCu6m001237;
 Mon, 18 Feb 2019 13:12:56 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH 4/4] MAINTAINERS: add myself as co-maintainer of I3C subsystem
Date: Mon, 18 Feb 2019 13:08:46 +0000
Message-ID: <20190218130846.19939-5-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190218130846.19939-1-pgaj@cadence.com>
References: <20190218130846.19939-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(396003)(346002)(136003)(2980300002)(199004)(189003)(36092001)(478600001)(1076003)(2906002)(5660300002)(50466002)(107886003)(87636003)(246002)(7636002)(305945005)(11346002)(476003)(26826003)(2616005)(486006)(4744005)(26005)(126002)(4326008)(186003)(42186006)(50226002)(36756003)(16586007)(2351001)(446003)(356004)(6666004)(76176011)(8936002)(51416003)(105596002)(106466001)(426003)(47776003)(86362001)(336012)(316002)(6916009)(8676002)(54906003)(48376002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR07MB2246; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55978060-9363-4e41-2ae1-08d695a2cf10
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(2017052603328)(7153060);
 SRVR:CY1PR07MB2246; 
X-MS-TrafficTypeDiagnostic: CY1PR07MB2246:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR07MB2246;
 20:2PiuCbbfr9rEyMleVTk65mCuzukwXLTK0EFWjDDSQggfM+EtIOL7tIjBj3dy3oTSeqNUiGwptwQNQoSuAqorzC6EjwU+FHluUr46cauxJw22ObYg3yjofMDdoyZ6/XjJK5qC9WQWTtWjV8J7SFCtyhskel4zEBeE6xJEYIT/77xvK2H0NcXZu62ByJM7NTEWCDk0tkM+/rvwvLVI5oycAg7jAiuiSAWRoeLIXxCjz6J7ITfrJOGqCEc0JOIC8U61XuU4zxcHGg38vcC25GPDFs9jF5X5Ohncc942qRrXu3g9Huteulkji19Puh8mGFri2v2JqgO68iw2oTwExME4FAa2HPT02a+kgVyB+X3NEESwrfGZ79eNwJ3ywa6/nB85yr6B/EC0v19Ue+rXqn3w0ioRCbaZJH+eBBoumYqJ2bskym7mq33GIvVgC3B1QE4bOTmQggIRMLoICDkVJDOTMsjJHjXifEzrM76wqFLJDgVLfCNNSSn6BtO0cDUIfnY8
X-Microsoft-Antispam-PRVS: <CY1PR07MB22460E51DE00E33A06C420E1C2630@CY1PR07MB2246.namprd07.prod.outlook.com>
X-Forefront-PRVS: 09525C61DB
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR07MB2246;
 23:Ff8Ed1KDzfPYwZa6EzVMwyrv4T6v3kC9u6I35m63e?=
 =?us-ascii?Q?Xgl64QS61XkJJ0fYCGX6ACXdODbdoQr7oeAfsVn16yu7Sdg74PcpSXO5xp9i?=
 =?us-ascii?Q?sUvWjN2GQtYd/BP1ApQGDggHnUEJXKAO9bS+lRx/ll44MWQUviaWZDMgdQJb?=
 =?us-ascii?Q?byF9lM2Y0ioTaVyJAHkLOz0x+vGBgjzLrkxS+S8ExXUolkRSeAEvSHkU5RSS?=
 =?us-ascii?Q?0hemvrz2J2pYx23zZnZB5A0QCEFhhichVGaKL1OmEeauVrqQKtXy5AAU3F1u?=
 =?us-ascii?Q?7G9ESR7keetRefwNvK677NTwDrXktmJfYb1Aw4EDMYYjix1LmWl3DJ+HFdkB?=
 =?us-ascii?Q?1XsbalaMXsBspOlRP0vnh6ydPB1zXwcB/I6yq3KuSpppuy/n3pxh1FT/jV/+?=
 =?us-ascii?Q?eRtRvqN7pjvxQ8Lh3nSkgIwf7mZ8z1u4ReGAMKTY7iSLGCXvOxlGwMJgNWfa?=
 =?us-ascii?Q?hx2xyepoOsihzfaSU95NR92yrUuLKAPP2ELwutWZY39tCyHIb9108r3uy5rt?=
 =?us-ascii?Q?DvKMHbxhQDdEvzh8sIKQZoywKn6Afs7pV9DVCCQo1XTNzXeY39HbDn9UUBmZ?=
 =?us-ascii?Q?DVRWSJD7A4dHG0cayZw60UOHgns6886CZpUsANOKn2o99uCrCVmx8ZExvWlO?=
 =?us-ascii?Q?HRQXxXzKGoDONWuZCKlJMRVDYL9X0ou7TKSmrHO3H03rBp4NPVAA+H9AgRaw?=
 =?us-ascii?Q?EuHmvnDLUtzyRYjp3J0Xyx9vEdY+97Zui/tNhGgzYkmwLaaF8BDxguDnwnno?=
 =?us-ascii?Q?2x5xn/OZVjm6M3qehxo7nV2cR2FahuJZE/QOFguQnMOQDz2AFr7NyNHHIvj2?=
 =?us-ascii?Q?0us5ObYvnsbJ8QG5GUANprf8jzgUdtlKBSF2PPTg87kvO3vvvVzagrizW/Ml?=
 =?us-ascii?Q?bkZHTWQ5o4cZtV/E9Q1/0b8mrzQAxvtewf5t6XzN7B0CqLMGVDE6W9hfwCJs?=
 =?us-ascii?Q?bOzLjeCbxDdpgXPJXQctejdFoDq6PE0JfT0gaohOhigGp4FycdQ4BkZdLMIk?=
 =?us-ascii?Q?KPLMPHVYyzP1rfx+Li6iIcCO+FDxr0/9shY+ExAfCc67unl8JgLEIqqCvkPh?=
 =?us-ascii?Q?4MBnEKYsrShwVKkF/R0xzY88BlG5C7WU+/Bo+/vh+yeVsj5xkcuzgqT0ilUX?=
 =?us-ascii?Q?1FfzfgsR8A=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 9pJ6t7gr/QAkdogtm0JAtdDQJEETUbMrncRINuW0F6sMEK8ajn77+tVZURa/lLoHf/YQsuvIfHHFaZnnvQnkYxm8imKW3qc5SiszPZ+DNUuX+BpSE28RjiiuARLAGyEu+hKQnHAueKMKSdSxk57dRFHSXo4JZBMctD/ztOyP9qBYbfj29OnYTiBb3vJJHhUF4Og8gCMIQPzvtKPZhS/2SGW/NCnw1nKmOrh3QPhpolj+eM5gG9XELEdlRsvWgy0rc/SwqjWyYMq9k0f8tFRUajUd520Nl7E1GQCPSteZpixbrIF6eEdqrqaGHKidwLK9fyMXPr93YHo4zGyi+JP712HlHLXUBYuDiZblTefpeqEcltWrwdGwne7SPmg8Q2OKDzlXUm9FNp2Gp0urhBwJQqqjoCgWglrqabgHCrfutok=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR07MB2246;
 20:d9r1Fe1hN+N8NN2TcBOyG/t6purB1YwHYiH5RPXrhGaHq0PcTcyyUWXDFenrIIhyU7ZCoeALqZMncwuRGGuvLbGRZrAb1mCJ60Xs3dkCO7gSFoFmjuStf2XNd7T0xoYiEEXz31wbQDuuphNf3Lucq6ob2QCXs9Hk11Gl7LKuuKmHrckNdw7szxIhOV/hv2xh9COkFTdxyjhAEn+7U9I1/NHy+TBdU7JYVsxfYB1b/GDeFzKgWlBX/d+T/PaCsn11
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2019 13:13:01.0047 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55978060-9363-4e41-2ae1-08d695a2cf10
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR07MB2246
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-18_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=926 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902180099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_051307_718337_D035D687 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-i3c@lists.infradead.org, Przemyslaw Gaj <pgaj@cadence.com>,
 rafalc@cadence.com, vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

As discussed with Boris Brezillon - I'm adding myself as the co-maintainer.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 41ce5f4..37a25f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7168,6 +7168,7 @@ F:	drivers/i2c/i2c-stub.c
 
 I3C SUBSYSTEM
 M:	Boris Brezillon <bbrezillon@kernel.org>
+M:	Przemyslaw Gaj <pgaj@cadence.com>
 L:	linux-i3c@lists.infradead.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git
 S:	Maintained
-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
