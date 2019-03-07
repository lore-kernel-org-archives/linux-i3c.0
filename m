Return-Path: <SRS0=nBCV=RK=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F0B7C43381
	for <linux-i3c@archiver.kernel.org>; Thu,  7 Mar 2019 09:58:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1930220851
	for <linux-i3c@archiver.kernel.org>; Thu,  7 Mar 2019 09:58:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eQwKIIDM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="McV+qqZN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="UnNE/deU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1930220851
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xqO7JTXrklaG1TXW8JQBWOJGXZsUu9CU1ETK4N+jlL0=; b=eQwKIIDMKsKDNg
	5tWXVKCfR8ta9e59LtarLcWKg4tYMPgb4lWQeAV95VTfRtoOQFt+xscV0BqrBZl66d7IQN/v0vgxx
	DJrxRRzHKi9TdrnHfMUQG8OnV3R2SHkkR/kFbhWmPCOcipLecZFwuqSIFNik/zuKgQZJV4vQ2zK2f
	RN4POpPYGp6GGNBq8BMKZdaI+K5nTi8Dt1/wq8M1tQXCsky0FWv0pHvJhfcViCUSDag9OTxWKKRf/
	T8hgLzx2W5QkHFOyvPzn19U6NPVoeFgm7Zg0nIOu7iFAq7y9T8IfA3UYbMgGUfCPKR4IZptG6YMBQ
	5Q0HaFLtzSiNRJf/XRWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1pnI-0002LX-IZ; Thu, 07 Mar 2019 09:58:28 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1pnF-0002KG-C2
 for linux-i3c@lists.infradead.org; Thu, 07 Mar 2019 09:58:27 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x279viRa017850; Thu, 7 Mar 2019 01:58:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=MBrXWjL9eNxg+Rk9zSkp3pjqxVFr7sY42Onet0/Qv4g=;
 b=McV+qqZN7Qhx9ySVIWRP+hKRxNb5FNGOtJg4Pi0HJVGfc6QykDYWBrN8anLmNNDOE3mJ
 SDC9PKFWUK/r+KsOx/jVtroRMp5/zK10ObOBIwWiAFQOfGiwU4APrkF6B04rLm2gr7qs
 /GHjRZwsMAK+7aajaiVebjexJPjUC4YxuKhv+MdcHuKCp/yUWexk+tMQRONN77r0emem
 5NXKs52ix4wcbkHOBikp91vOP+xvzyUQvnQW6a7iyJOTbIcv91w4VBMAA3mME4bCuQK3
 d8wSPObDOPRnExLENqz+cr6gElupjuC2C2qW68T7YFHgyzRlZd/9+OYc9oXoCyBd95Ta eQ== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2054.outbound.protection.outlook.com [104.47.36.54])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2r2bec67am-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 07 Mar 2019 01:58:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBrXWjL9eNxg+Rk9zSkp3pjqxVFr7sY42Onet0/Qv4g=;
 b=UnNE/deUhoRRAmetbL+Pix4Ifc38uEXzxrUdhR06qLFwn9uCl/LLMbCKBukk3Hk4doU9J7s1etWZMqEVndFaZq3dyEbrnJ31UXFbgJxJ1NaddUOVTtULfR6f5P4zZ9lYSsODbbZf1U/XycUBuH2vkOrpM0POGDYMtmtFn5DQ594=
Received: from DM6PR07CA0062.namprd07.prod.outlook.com (2603:10b6:5:74::39) by
 SN1PR07MB2173.namprd07.prod.outlook.com (2a01:111:e400:c455::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1686.18; Thu, 7 Mar
 2019 09:58:19 +0000
Received: from BY2NAM05FT028.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::201) by DM6PR07CA0062.outlook.office365.com
 (2603:10b6:5:74::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1686.18 via Frontend
 Transport; Thu, 7 Mar 2019 09:58:18 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 BY2NAM05FT028.mail.protection.outlook.com (10.152.100.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1686.5 via Frontend Transport; Thu, 7 Mar 2019 09:58:18 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 x279wFhP016727
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 7 Mar 2019 01:58:17 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 7 Mar 2019 10:58:15 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 7 Mar 2019 10:58:15 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x279wF2t023766;
 Thu, 7 Mar 2019 09:58:15 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x279wFRR023764;
 Thu, 7 Mar 2019 09:58:15 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH 1/4] i3c: Drop support for I2C 10 bit addresing
Date: Thu, 7 Mar 2019 09:58:05 +0000
Message-ID: <20190307095808.22540-2-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190307095808.22540-1-pgaj@cadence.com>
References: <20190307095808.22540-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(396003)(346002)(376002)(2980300002)(199004)(189003)(36092001)(76176011)(26826003)(51416003)(5660300002)(8676002)(50226002)(356004)(6666004)(305945005)(47776003)(87636003)(246002)(2351001)(426003)(26005)(5024004)(186003)(50466002)(14444005)(48376002)(8936002)(478600001)(36756003)(336012)(126002)(1076003)(2906002)(86362001)(2616005)(476003)(4326008)(107886003)(446003)(486006)(11346002)(105596002)(16586007)(316002)(42186006)(7636002)(106466001)(6916009)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR07MB2173; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 993f88e5-6ca8-40ef-952e-08d6a2e36cbf
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
 SRVR:SN1PR07MB2173; 
X-MS-TrafficTypeDiagnostic: SN1PR07MB2173:
X-Microsoft-Exchange-Diagnostics: 1; SN1PR07MB2173;
 20:91YwZUi5OQKu0smfEGdX4O+TD9OmziW+cyEcFB8Onw3eFOWJm9gYojDbueQRmmxPhjfiy65y+iNHNw6gy+Ovaz9pcKs+aZZonIoldOZ5vqEbyr1MAXEHgP7qzoL+giRIv4MAknqgmXnFJmBcjKebdS59L2nQgfgEPn+DbiMQdLTOHhVe0oxshyRiZPg33+Dk3lfPn7dDNgnumxwb0p4tOtXarzXUMFbsQSFR+fVfQPpeBAfgXf1pIsZ0OywWgkja01HjZxWaipWDlcX3G/6MRKDuocnjw8kc6qhCxcoMpAKVvbdlzMN6ZvSFsU730vPQqKqo+8pa/XiD0vIqacDYAGoxViCkKIcBMVte3nPKg0GrvtAJZ3GA1QRXoKIB3X3+SvOAxvP+OaxzXfm1TxQyRq15ipTBVID3PAvkv/YsosddMtc/teSYlyyuJpLkwiry4s/15kebVo1nTXNYowrR5/L7kjt9FmlTzi2c7+lxpa+l9dQuZF+GXY8mi4+coILC
X-Microsoft-Antispam-PRVS: <SN1PR07MB2173B3C4FAF4AE8964AB38C0C24C0@SN1PR07MB2173.namprd07.prod.outlook.com>
X-Forefront-PRVS: 096943F07A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR07MB2173;
 23:XlquxGH1ZzbyFklAI+IsjVNrUKFFiUc4X+Y5x2TQS?=
 =?us-ascii?Q?qWXgaBglLfS4rbl4yVA/uAY9KQpAFZCLvJuszvp1WgH2b8jSZ2SjWKALStvA?=
 =?us-ascii?Q?dALq0ogGm8PeOvSVBL8jkQknVYzogEU8M3u4Ul/OoDV2X5FzEfw8pON1Ov1m?=
 =?us-ascii?Q?0n6ZVygourgxVb0HQI7erD7lT6bNLNcye+D5XFlTQl5DSesDJ1AOUxT7eQFd?=
 =?us-ascii?Q?d2qMtmYf0cWg7UUFx3RvSmAYOuDPECCib2M+4YBvIpOu5uvUrK1egwgLeVfL?=
 =?us-ascii?Q?ygecLuBe/RyQkjbfRnjPO9g/i773O+DJuXA2ru1phmmQ0A0ehUx95nXZWW3m?=
 =?us-ascii?Q?CDYEAvavEtkGmSS+hx88HOCYWjkwv/lcHBSEU0oJzhDImRZbLn+H6k9ifFzM?=
 =?us-ascii?Q?1zSrCphBT8moZ7b7jvxT1/0lNJbyxbINNzvZrWj31pQXyiSIYG8dZBIqWImc?=
 =?us-ascii?Q?mGQb5JQMbvoX70X02GpVp1C8bxC84d3cDJiCXVjqWpW/oC4cFiDq3R8A4/+k?=
 =?us-ascii?Q?D0sOdbVkCcLIyzAyPoMog7h/8cAHbpYglCGFwlLcI8wEYVz9bFMH7Zj+Heql?=
 =?us-ascii?Q?jqpXQzVgQPlaBidKU61MbPAmPZ0JJ+bUa0fZ2hthpfmCAaEQ3+2klf6GTU0Q?=
 =?us-ascii?Q?InsrM8LU3x+zCUPIZG2ukTLvmb1De8jn323xa4oR6MzQmbcH8zZTJHLxpjMr?=
 =?us-ascii?Q?kOVBiV6RHaAX8WNEcZ6Z29VqJzCySftZSetoLMZBZdHqsiIUh9buumjwm72N?=
 =?us-ascii?Q?/xj2sikCWXvHLjJGj9+QycE2x4DrN8yHbSZZBz1HP1OtD2TMmfj30TrwpPc0?=
 =?us-ascii?Q?KXJq44ZkTXTObCe8oG6EIaPVQbNJp+VZwVipFlQl0ToUfbXLatQVdTZFRcz2?=
 =?us-ascii?Q?XW6I7prfnjCbyOcbtXhBfGnP3swof5rs1tNwe5krxdrmkQsW+PMtP/xiVFKg?=
 =?us-ascii?Q?xPMG4gKmbMvdMYJVS0LJsuivR6mhAA2zciCEr7G/8cnVo98mO5ts6PmQ627D?=
 =?us-ascii?Q?ILPQ1hI7ftF4LO3GMYoNdO3BIPRWEQw5Ch5aoNx6yJxx7n1/AC/DWfTl3CWA?=
 =?us-ascii?Q?emOILpQw+ddyYX0LlfYKhxouVMueUs0SG/46lA/C/cXCQNRd/mQ0ICNe9ekZ?=
 =?us-ascii?Q?KEBNEQzLMBgGND7Ow5xx/zlAZVqqNSf?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: uEr0E79FYCf5nvQW1EF2RrJbe5B/yBhNdBakR2hQsqAFDw/sauoL7b8vgkwNZUG4wqiy/Xw6nCGhNXhHtoM8jD8XPLMBUuiUI2kGE0HbefY+mPXgOKt0R9OOfHFcnczH0sIaJd8lD2zMx+0ojj+/oG9MMV87QyNngknKRYo2zQtELdwMAwbaZJ//6BMBUn7ieso5bwnaiAEDFKAHYNzLHpDQcuTDeWgulzvixhEStJ/8IAOEz7LSoDfernISzDYOtdODHGF6D3Z6O31mRSrF7+NNrGhS5yeDnueLBSKDmCrcTNSO3bHDn5pTeeHwAk988WO0hakMGYlVKZSy99fiuq/zbAKpR0lKbcZCuYBEE+uAzSbKErjYzb8EKjyWid9w2Hn12Tabz2gUbE4lGwgbUfdrjANqbvV5a9H5xOMxuAs=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR07MB2173;
 20:I2wdNI+Fp8fsPCBNVn5bqMsT1wotOy0GV/97KcDy+cbM3Msgn4XlC+3vYRBbCUd5J0AnP8+me3CSxI/sr5FbxpRkme3jpb5WXCyi8bCiscFFnocpHPDRUKMx3/c5PpweJh0gtnppG7pUaweohjO96vOy558+V+XPakyBo0AdLR4kHCUmIx6tCyGJNjrTBlnmacuoS1a57O81PaZo9awb0AuqEWOym5Kf417nEvyrIsu++yYn6vBhUv1ykhhWMBcF
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2019 09:58:18.4654 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 993f88e5-6ca8-40ef-952e-08d6a2e36cbf
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR07MB2173
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-07_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903070072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_015825_517537_5C2B67DC 
X-CRM114-Status: GOOD (  13.75  )
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

This patch dropps support for I2C devices with 10 bit addressing. When I2C
device with 10 bit address is defined in DT, I3C master registration fails.

Address space for I2C devices has been reduced and ->i2c_funcs() hook has been
removed.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 drivers/i3c/master.c       | 19 +++++++++++--------
 include/linux/i3c/master.h |  5 +----
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 2dc628d..5b3adb3 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1962,6 +1962,16 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 	if (ret)
 		return ret;
 
+	/*
+	 * The I3C Specification does not clearly say I2C devices with 10-bit
+	 * address are supported. These devices can't be passed properly through
+	 * DEFSLVS command.
+	 */
+	if (boardinfo->base.flags & I2C_CLIENT_TEN) {
+		dev_err(&master->dev, "I2C device with 10 bit address not supported.");
+		return -ENOTSUPP;
+	}
+
 	/* LVR is encoded in reg[2]. */
 	boardinfo->lvr = reg[2];
 
@@ -2111,16 +2121,9 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
 	return ret ? ret : nxfers;
 }
 
-static u32 i3c_master_i2c_functionalities(struct i2c_adapter *adap)
-{
-	struct i3c_master_controller *master = i2c_adapter_to_i3c_master(adap);
-
-	return master->ops->i2c_funcs(master);
-}
-
 static const struct i2c_algorithm i3c_master_i2c_algo = {
 	.master_xfer = i3c_master_i2c_adapter_xfer,
-	.functionality = i3c_master_i2c_functionalities,
+	.functionality = I2C_FUNC_SMBUS_EMUL | I2C_FUNC_I2C,
 };
 
 static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index f13fd8b..eca8337 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -48,7 +48,7 @@ struct i3c_i2c_dev_desc {
 #define I3C_LVR_I2C_INDEX(x)		((x) << 5)
 #define I3C_LVR_I2C_FM_MODE		BIT(4)
 
-#define I2C_MAX_ADDR			GENMASK(9, 0)
+#define I2C_MAX_ADDR			GENMASK(6, 0)
 
 /**
  * struct i2c_dev_boardinfo - I2C device board information
@@ -390,8 +390,6 @@ struct i3c_bus {
  *	       and i2c_put_dma_safe_msg_buf() helpers provided by the I2C
  *	       framework.
  *	       This method is mandatory.
- * @i2c_funcs: expose the supported I2C functionalities.
- *	       This method is mandatory.
  * @request_ibi: attach an IBI handler to an I3C device. This implies defining
  *		 an IBI handler and the constraints of the IBI (maximum payload
  *		 length and number of pre-allocated slots).
@@ -437,7 +435,6 @@ struct i3c_master_controller_ops {
 	void (*detach_i2c_dev)(struct i2c_dev_desc *dev);
 	int (*i2c_xfers)(struct i2c_dev_desc *dev,
 			 const struct i2c_msg *xfers, int nxfers);
-	u32 (*i2c_funcs)(struct i3c_master_controller *master);
 	int (*request_ibi)(struct i3c_dev_desc *dev,
 			   const struct i3c_ibi_setup *req);
 	void (*free_ibi)(struct i3c_dev_desc *dev);
-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
