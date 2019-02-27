Return-Path: <SRS0=zb1T=RC=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 053C2C43381
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Feb 2019 18:38:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C57D62183F
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Feb 2019 18:38:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VHHN603P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="EtD701/R";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="brhmbmkO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C57D62183F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nZMZvTR/5LzqzhL3sgdgMOjko/RS2989FF57p/XsPgE=; b=VHHN603PKSDF46
	9ztqFSlpGIpjAqXYY6bn2YwDmi8pibiO4167i99RiFstTcpNSgd/4U9CLQAvqObTK75tF0WXlLAue
	I+2uaO3L6OnyzuWgeVXb0cItisqvrMNe84PDHfEI/QwXqKSB4kyoC3dlUK+XNM3Bqi5fhLJin5VnY
	Y62hVMcBkfwxsL2SIZcNX5vhdBjCATKOv5hWZBELttYAQDuP/MCO+S03pEP3KtoW6jRdGe5iesNiG
	xqzGlHpgcjUmx2/4MZSp5HfJDf8RDI5OpWwVvtK3Fo31nv1THu3L8X6P8vkONCBuwK8xnmP8zQv5x
	7gpOndBbgVm2QjbWCxvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gz45z-0006MH-Cu; Wed, 27 Feb 2019 18:38:19 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gz45w-0006L7-9o
 for linux-i3c@lists.infradead.org; Wed, 27 Feb 2019 18:38:17 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1RISYM6032296; Wed, 27 Feb 2019 10:38:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=kr+09019aWorNo9bPr/+2Pt8aPrFRvmBMWN7SMIr50s=;
 b=EtD701/R7hLoNcKbICMHDkYQiKpkqBROkGPzzSIwh0heyhG9az2WqFAbtHbaueK6DzkE
 QGpsA18oCcXdKnyBkvSXOJa+qxTzjW7dLNJ4mTGMK7v6g/Pl6haFvJdPk8ozjDH5DXie
 E2KXk5EERfFb8RLLyfDxq4vOvUl32Ce5WTAFjzhHOppKLc9gFachbHhF/Lhph50T62c+
 yNKj54M322HYHEb9rTILMF77W2WQ2WMYVxtdiostWmwaGKGOgZeaOB5BIveOL+9Xc0Rb
 vnbZCbbWXvcVZA4uedXj33ItpC+Vg3QqUtLDf49+gx9h9MMF1fhv1y/N3dg4qOcAbV5I +A== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam05-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam05lp2051.outbound.protection.outlook.com [104.47.49.51])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2qw9jq5tat-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 27 Feb 2019 10:38:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kr+09019aWorNo9bPr/+2Pt8aPrFRvmBMWN7SMIr50s=;
 b=brhmbmkOp15JE2qhiEDANGdMt4ZuKfNsGwXVCkRLEEnHseRTO7fajY1maKGzsDMcQOmuIMYHsWesFVGjPmAeUxGEAN3L4GeK3kuvPWhfjpUr7YrKINUSCLMKjjtAkATlPQgqyTHpzcPCEMJLXShOu4hsSAyxKAn1HvJcn68nCfc=
Received: from BYAPR07CA0034.namprd07.prod.outlook.com (2603:10b6:a02:bc::47)
 by DM3PR07MB2252.namprd07.prod.outlook.com (2a01:111:e400:c460::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1643.18; Wed, 27 Feb
 2019 18:38:11 +0000
Received: from BY2NAM05FT060.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::201) by BYAPR07CA0034.outlook.office365.com
 (2603:10b6:a02:bc::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1622.19 via Frontend
 Transport; Wed, 27 Feb 2019 18:38:10 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 BY2NAM05FT060.mail.protection.outlook.com (10.152.100.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1686.5 via Frontend Transport; Wed, 27 Feb 2019 18:38:10 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x1RIc5n6029387
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 27 Feb 2019 13:38:07 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Wed, 27 Feb 2019 19:38:04 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Wed, 27 Feb 2019 19:37:58 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x1RIbv2p016020;
 Wed, 27 Feb 2019 18:37:57 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x1RIbvVf016019;
 Wed, 27 Feb 2019 18:37:57 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v3 1/4] i3c: Drop support for I2C 10 bit addresing
Date: Wed, 27 Feb 2019 18:37:47 +0000
Message-ID: <20190227183750.15367-2-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190227183750.15367-1-pgaj@cadence.com>
References: <20190227183750.15367-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(376002)(396003)(346002)(2980300002)(36092001)(189003)(199004)(68736007)(26826003)(50226002)(8936002)(81166006)(81156014)(87636003)(478600001)(6666004)(305945005)(2351001)(106466001)(316002)(1076003)(47776003)(97736004)(356004)(8676002)(16586007)(5660300002)(76176011)(42186006)(54906003)(51416003)(86362001)(446003)(50466002)(11346002)(476003)(2616005)(486006)(186003)(426003)(5024004)(14444005)(126002)(2906002)(69596002)(48376002)(6916009)(107886003)(105596002)(53936002)(4326008)(26005)(36756003)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM3PR07MB2252; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1e1070a-26c4-4a17-5a1b-08d69ce2b964
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060);
 SRVR:DM3PR07MB2252; 
X-MS-TrafficTypeDiagnostic: DM3PR07MB2252:
X-Microsoft-Exchange-Diagnostics: 1; DM3PR07MB2252;
 20:F6xoSV0KWVwGTP4cFsWNC1eTNvBUH6hTAwlftr09WEnjoYQlwz1flBkNTxTYPjWfDc1Af7Jn/ooMYrb/9RO105qAilMpprgCL9fFoQfZuviYmGJ5hYvwscO4k+FF3VJrdtN2JoazK/eAHashgTahcIeN25pw9cBpR/O+TyL8qujTmHy/eJNutbEz6nSVZehPRYMSMV39RDldRj5BbnXd4xwkQ/G8MA6W6zJeI4oxwj0VVOkEmb9IUNG/5+brsQ0DvQv/DWqjLAm0UheYztwq2DQqBWaMpSSbxDSRiE4V7b2f3GQb2QRpuf7nBSjPxPfCEVeRiAjX/y1xphet75aoUhbGcj5heXiN5/19sUhIBcn7L7zrrOGOsLSultWiq4XEXtQA7oiIcA01+H3gZt02CK+CDdNEa79U+UUaNb+WaLzS7norzYDzYig8FZWrD2ZbmPRGeB5jfWAoc4aq/aeuGklhaEdAA9JRqMBkZ+NohtWWtElVvE8uE4Xc2UEtlqow
X-Microsoft-Antispam-PRVS: <DM3PR07MB2252E59E47110018E88DA639C2740@DM3PR07MB2252.namprd07.prod.outlook.com>
X-Forefront-PRVS: 0961DF5286
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM3PR07MB2252;
 23:8bV3deakjPOvccylTqgeHecAaRr/JaNLOCqv9CA/W?=
 =?us-ascii?Q?ynNozx5FBMWNowHqnH2i+b17hpxr6X3DYL6BoySNIprdDdNmvG3h9ojYQpns?=
 =?us-ascii?Q?Z1n/4XQElhhxHknTCstuTuXIH0zLRx6X9YyQRyFXsYTzuJmRTGOiL1ugWExh?=
 =?us-ascii?Q?keDfuEpNcrVgElTUMFlczE+yB0y66E203Qw4wlvYY0ExGl0FhdlsOkdnC9E0?=
 =?us-ascii?Q?epNCnvH+zR3qalF4KZEqd8LXMGv4NWydxh66lGtb5ZOW2aVHph/OCy9Feu4W?=
 =?us-ascii?Q?VqXckRyvx5E5iTbASR9feECYLUipc5f02dMuz6aUvuvCKcnysIreFsuIZGAF?=
 =?us-ascii?Q?k7BxAYWtCGTlwXFOh5o6Vu0HfmUe+BT1H0dCALcLfjbPVG5uWD1evengk1cZ?=
 =?us-ascii?Q?emHBIdAIpKDI8yhGLS1HPIjr/oN6tG/2GdDvCY2zQEE4gdUIsuCR+Iwb/JxF?=
 =?us-ascii?Q?UXoRFO/gqqoLL1HY1B1e8yUw+uXwUs5JmpPWOyDNrjSkN/VZMP1pZiZpTWSj?=
 =?us-ascii?Q?CaTb5nrVY/pXNjhXh4V+hjlyisW2Hf8Djoe3+74RCLwwjfWuFwJrc2x2FJYl?=
 =?us-ascii?Q?CEiy696/j3ibUtMlSQf61I67456TCvtIXCRV7JMyxABi+fuEtMx1k8Osg+2L?=
 =?us-ascii?Q?MzclrVB7MHU1aU+zIzH8QSpDSBe5r9+kxyjgdrrljLiOq5K6RZ4yG0pRbffA?=
 =?us-ascii?Q?9DT8l9+fc7bFq6t8l8djkQILf6usBVrKyrwZd+VFdk0cURN+sk5Le8RgbDlS?=
 =?us-ascii?Q?x5XvVo5VBzDULTO995UBrnvzwfcdPscm1O7DNqhI0mraX1dIwhv+fadCRdZo?=
 =?us-ascii?Q?rFLNgmvD7hHZcgfFrXI1ZzItyAyLgj/LAj5rB1XYduhHmVn4gKtr7ROG/ng1?=
 =?us-ascii?Q?5BZv1QW+l+TMRzU76L4+d4UsWU/L/KXGygTgBg4hhFvvIfEd2GuO4tjBCQTn?=
 =?us-ascii?Q?czDcQ3//xHpXrViRtHGVHu9vdLykrl4rtojIWbzhLS72Trh8m7NV5L7Porb7?=
 =?us-ascii?Q?G4zWhyix9W0HxhHXgTLKMP+CTBtbeuhFYDKRElDjoQ5W1AGa2WynVPnXts54?=
 =?us-ascii?Q?QIvaiyvegnkd/S29sJ6y/trU8nnBzEfogzI4aF7unwH/oK36793X2Pnh7Kt6?=
 =?us-ascii?Q?aLxl1JrMFi01/mkZYL/q1W4LV9GuuAFYmAGJY//pbz4sZ+gaRLajbmOgK1Kh?=
 =?us-ascii?Q?6em0utGXg7CTf+FgQQjcqhBIjvCDoHotkuhqCUXo61O/rEJeYxz7LNSrQG0G?=
 =?us-ascii?Q?fp6wgm6RadPaMS/dWo=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: rAuJpkvWLQav38en3gL9v+hl7HLQwZkHYxN+oJ0pi35VbZbcjan8tMcxeWLIMEQG7t/qOza7Meb1xiRA4FRiDOYAlA788SOMStQrPV+z2SodGEXSfDMMKX4yBZIqbBAJ6/LxtLX7Cw2ygBSYvyjsrz9bFARt/glDRWmdpA5VlND9rE1rmmLZeCiz/CLG8H+zy7PNKsEpjkCwGHyoow0ZjW9NDZ9SlX4mGxLcUA/9rk/vU1iRESSp+lEm7Oxy+T8w3YCVHYLOXhRkyUs+esTZO6exzSyfRNG76OIcKuae0RjWdlstzUPEZuTNtGs3VFVah1yPM1gZVGmbvxlEoCR6glRp3kHYqCciOCiRiiO1hkhNpieAbPgT8NuFiLUkSETY5ZKRCTBAUSG2SOdALpyE7PHGRfLlZOAMs3klksLFB+0=
X-Microsoft-Exchange-Diagnostics: 1; DM3PR07MB2252;
 20:3BPkqFUOaT4Mdgq5mr8a7/qb2Yl1CVpeNZAQwKCg2H4LP8IdHViGK+uiis/U8YLrPgKMy29FHYPqfRGJ3ENOVpDcl2SQjxN01wxhw58GZi/99BhqRgbThpNAjC+FTtuWhePiKTSalYN7y1eQ+GUvxUgRBSjOdA4BdzNJ5idUMpYB6secQTXDIH3Z9SL0SY4WhiOnFnwfWSFETWsd/SbAUBtsR9f0kErQLZOUEHMlMe5fgf99Z96A/vy2tzdvaX+E
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2019 18:38:10.3905 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e1070a-26c4-4a17-5a1b-08d69ce2b964
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR07MB2252
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-27_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902270125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190227_103816_453099_41824DA7 
X-CRM114-Status: GOOD (  14.74  )
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

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>

---

Main changes between v2 and v3 are:
- Remove i2c_funcs() hook.
- Reduce address space for I2C devices.

Main changes between v1 and v2 are:
- Add error message when registering I2C device with 10 bit address.
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
