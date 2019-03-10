Return-Path: <SRS0=lIk1=RN=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6BC3C4360F
	for <linux-i3c@archiver.kernel.org>; Sun, 10 Mar 2019 13:59:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 908402084F
	for <linux-i3c@archiver.kernel.org>; Sun, 10 Mar 2019 13:59:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UYQntx+C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="JHE/YDQ5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="Cwh5ZjGV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 908402084F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=caQL9ynuAbsuuvfUVmwXvvOem3hTlFH0f5H1bgSp4eM=; b=UYQntx+C6BcQEW
	z3iiGBzkTnbQFT8ssU0EEFvr4klTV/jNOrOToExscQRKHfLPm9XGdwRT+wa6veil5ia3BcD1n8UBe
	h7Rt/Y5D4yo9yAISZeZdTkHIrw3fBAxVcaJCndTHLjOFYR8djFlI/uitUOJQZUtnfayOEJGGCZiQv
	sBrku45wp/7nzSpFpLbeTlXuOcAtiCPuQvXRWBK5Skfvk91fJ+tST1RQXJYUksX5yKGMUfuquoBMB
	pCOR4zWWzTRqoAlcPTAcygmbLjgUEdbUNYoP/oAF/RnZ4pReJk5vQ/xQ5ITkv3t73fatw9xxHTBbs
	qVbcTF5bi5ld0eHxuDCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2yzC-0002sg-38; Sun, 10 Mar 2019 13:59:30 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2yz7-0002qV-Je
 for linux-i3c@lists.infradead.org; Sun, 10 Mar 2019 13:59:28 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2ADspKP025223; Sun, 10 Mar 2019 06:59:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=A8ZIWgE3iB9WhRtsrCjWogOXAYSEPV1LsWhWPHTFcIo=;
 b=JHE/YDQ5PpR6BHIxYVYRj89/10Wnc1jJ3qPF13iKF+a0r1WPOMJyo5dH3sM4uj0888GT
 wzahX1oom1iBWecFOfXbkbrJdgV3dxzlGNFqWavTk2DtreM6a1na8KTvtbikKEwgNn8K
 3cgxb3kD4vhRZWmxEVPqQG3OHP5ZHvp7G492nCaML8IVoeGDPapoumC+0C6IyjuiNhNg
 kwB3jBvHYSV7KaZTt5j3b6HTR4wAbmkRB+Z0yTVs+SEELWE/F61vCYKHbqM9UJ4EH/6T
 YBzdJx511uCglXSaSFR4pQotpfqBn0/qYkjQYRp//+rOT9CN56Yfo3Iks/R/ynkeozME bw== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam04-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam04lp2053.outbound.protection.outlook.com [104.47.44.53])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2r49y1cqyf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 10 Mar 2019 06:59:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8ZIWgE3iB9WhRtsrCjWogOXAYSEPV1LsWhWPHTFcIo=;
 b=Cwh5ZjGVJKF/+/vYC8e+fOTLy/N0A9ioK9cSKkkKtN9ur1/rZlc1AYeHgNGlqDqP+CQ6rstmIcpL6RZJpbGQlf8mXPmo0Phfvto1bvT7i+O8jzrHPxYi6R+5JSOUr5TZB/j2GaQCL7OY+yub/LFws8FwBvKB1IN02X5HLT0Imxc=
Received: from BYAPR07CA0061.namprd07.prod.outlook.com (2603:10b6:a03:60::38)
 by SN6PR07MB4719.namprd07.prod.outlook.com (2603:10b6:805:3b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1686.21; Sun, 10 Mar
 2019 13:59:19 +0000
Received: from DM3NAM05FT039.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::208) by BYAPR07CA0061.outlook.office365.com
 (2603:10b6:a03:60::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1686.16 via Frontend
 Transport; Sun, 10 Mar 2019 13:59:18 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 DM3NAM05FT039.mail.protection.outlook.com (10.152.98.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1709.11 via Frontend Transport; Sun, 10 Mar 2019 13:59:18 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 x2ADxEpk032144
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Sun, 10 Mar 2019 06:59:16 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Sun, 10 Mar 2019 14:59:10 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Sun, 10 Mar 2019 14:59:10 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x2ADx9P4022549;
 Sun, 10 Mar 2019 13:59:09 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x2ADx9sD022545;
 Sun, 10 Mar 2019 13:59:09 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v4 2/6] i3c: export bus maintenance lock and unlock functions
Date: Sun, 10 Mar 2019 13:58:39 +0000
Message-ID: <20190310135843.21154-3-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190310135843.21154-1-pgaj@cadence.com>
References: <20190310135843.21154-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(346002)(376002)(396003)(39860400002)(136003)(2980300002)(189003)(199004)(36092001)(2906002)(246002)(106466001)(6916009)(105596002)(316002)(86362001)(16586007)(42186006)(54906003)(305945005)(107886003)(8936002)(7636002)(336012)(51416003)(76176011)(5660300002)(126002)(26005)(486006)(1076003)(2351001)(186003)(2616005)(87636003)(426003)(11346002)(476003)(14444005)(47776003)(4326008)(50226002)(6666004)(356004)(446003)(26826003)(478600001)(50466002)(48376002)(8676002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR07MB4719; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 681264c0-8462-4973-72d2-08d6a56096b5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060);
 SRVR:SN6PR07MB4719; 
X-MS-TrafficTypeDiagnostic: SN6PR07MB4719:
X-Microsoft-Exchange-Diagnostics: 1; SN6PR07MB4719;
 20:weqsnM1kLD3PD9GzhpqKrpyXxo31QAEx/jOENFmj9KUkKsHnS2xRO8w+guFc0+nrxS5YC4ZA64w0kOhp1+4CCSm+nLLQwoWQIBufj3t+i43C09tFAg/13nJ651McyZCFh6FgDU3VgSiypy6TtkLK21p9ejV/In+dgV/TBGOvYFYVnrUbChF9DrinuZKm2GHzF9Yx5E6TQoUk81eJwMjQX96UZdpKho3krtYQyEmz3BZW+sKSf+/mG/1MVOTKtaIxl9V5+fmUbHpQCdL9XL4fHyilUwGa+xQGEB+tKfrt+wbgmGPz0TM/5KqGVukOLWPgdZrTMtbdRRbIY1ndi5dsw2tZ2VbmcfU2KtiQw6Nz4x3aQIDmhQ1e0X9T7FKfFf7FokRSXXIB7LSVHhmgUZXx53IJO4ZiqPwYIsw+g/EvjyB4v8fvFMRSzSEL7StLVJPxhqXBAYdAKd7yRfKY/fEtRbrebDiNCf4Ofyglk+yYW2uCipoifCuVIOYK2l2wpSxu
X-Microsoft-Antispam-PRVS: <SN6PR07MB47191E40636A91FDB4D36320C24F0@SN6PR07MB4719.namprd07.prod.outlook.com>
X-Forefront-PRVS: 0972DEC1D9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN6PR07MB4719;
 23:u6P1Tj6gJEaE0TmsKjeZtqDIcx3VAxeyj0pFJ4Rn1?=
 =?us-ascii?Q?MXLvmIzdZIqtaldVuwJw6Gojv5FzZ71Urtmapl07AeExaJyQgZ9mql2WDTzG?=
 =?us-ascii?Q?8hkeMu6IUZrN41x6Ob3x8sszB6BMflViLGJ3u6KhvWlr+CItG8QROKuRkHrV?=
 =?us-ascii?Q?7gdMyXgtQhY6WVbsj2g21Ko7ATjs4+NgeaRUqIpdPlu2T5dtJrtENgUR2U3p?=
 =?us-ascii?Q?XMM0EV6lrJ4r1zYUyd3vXM7GITlEinYr5NS30n7hqimY+Rfr7DK1gefwB2CD?=
 =?us-ascii?Q?TuOw+nZWZWqGp/xdg+0XIyb3OpNhoAI4Oo6PdoJM1LVcTlVz1jAycw1uvq8I?=
 =?us-ascii?Q?eDArbh3C3wyL7tfXOSdYikeOi1Sf2AqEEnsrhR5YZv8u+wsUJZRxz7BsnQJL?=
 =?us-ascii?Q?JT9PHMQ6jdO5mq1jSM1mfts8T7nqlDPKudWrL/cs0Io9+qhu4wMGHiOF3BaK?=
 =?us-ascii?Q?wloFV/3nrzInGzb3p7gsxqsOVcNxVQxagLT38Vb0/YbS+tqxXFbAHK00Byn5?=
 =?us-ascii?Q?T/ktwuxa7ck6/mMx48uDLzCSzy/JKb/QWer4xx6/C9gVM/eNleTnKywh6EwI?=
 =?us-ascii?Q?fzRFSO+6rjAHN4c5UGbrlaFp2NPHvgsdS6M4lv2lX2WqA4UTOc1hkNuFAk2r?=
 =?us-ascii?Q?Nrw6B1SsnY70zji5x6b47ExD/g1xDj2kRm5MB+dM+OLuCMuHug2nD2O1gPCW?=
 =?us-ascii?Q?FuZGeXj6TqtWSuH1lTOeKq5rxO9IkIfQnzHsn3G5pGF3v96IQRZYZYQWSuOE?=
 =?us-ascii?Q?K9T0ifrMq253cQtoHaJRpRqwHyLw7DOjUkflT8XXgGqoQhj1rvPMOOBEdcC8?=
 =?us-ascii?Q?OnZySvNB97ZwhTjGVN+XWnidon8011GXzobHz8eBKOwks3MtjoBxaOWMrAd1?=
 =?us-ascii?Q?Hc4BuvjU/37hENLXbL+srWNXQFnMQ0FkeySVi1G/PuN/LJj9Zpcot2ixLK4Q?=
 =?us-ascii?Q?K8kJlVL+eFE9OK8fKltU3CySBHjUJw+ezA8UJn3hxRikWbiOtnfltgFEJkXo?=
 =?us-ascii?Q?zdNxEogLhiTkrtMINFDaUgcjX7F4nvesNFJgc7rdZ8bp3DofJQrOiwggMODb?=
 =?us-ascii?Q?zOqVM9cCUh+1459tVrIdbyG6qCBo1hAyAiIMDbTEp9ybahEhs4AmwQOjU9ig?=
 =?us-ascii?Q?qjRBqMcUR8=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 3qvb3umG9DYVkAS1FrAPn2YM0nuyODZUPvCCOy+1+58skprhhLQhn89QB8xrW1jtADl8nVK2C2utjch/uDu817zeeLSfQqCSVb6V+k+e+8NYP8vFyxXHw6t4rft+aPKGSEggo0Mw+AmvMf0j6YQKqKHfOcWIXrP/NKmvSXbwVoL928wKCnnlkabue9TsBh0UeTVYkm7JusTcD9LXcugGQDzLqzm4UB/lrgKnABQNQjep3d5+Yljswa0nKHeXOqVVz2pnOiAifRl0ua0n+BonQSxEcVvHdpusPKY4Mau3CUC26sy3p1dtwsOX9DUll7/HmEySJxxb6gNo+kNB0DbQrsm66e65bfjr1/YM/AjcxdRIqEn5hX5uQWSIMDEqRlmoi+8y6seWmyf7nSD88N1QS/6tBwHjlTjS8cXcwXPHlbA=
X-Microsoft-Exchange-Diagnostics: 1; SN6PR07MB4719;
 20:Iu3jnSo3lrSkOWhWPn5GHvs+QneyIi9HLd31Cyn/d9+9F26RsNkwyjodS5YNmalAtDeWL5GjevJOX2nkAh3mAjWR0uuTZdJdndm70G8f5Qt4nyDMz/XIezBFEMJEAqgwj25N83jMUdHC1cTzdjJ1d+YA5N5Uo4Rb2qGFg3lNjn7DVAakJM7xcwgjCprUSk/3a8bOyjeAsmMz9v1vGPsNYe47+Rtq4lyzWezoDdhfCpWxiR+QKQ0hxpkJFFlM/7kM
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2019 13:59:18.0508 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 681264c0-8462-4973-72d2-08d6a56096b5
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR07MB4719
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-10_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903100109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190310_065925_964598_AEB04101 
X-CRM114-Status: GOOD (  11.27  )
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

Secondary master driver has to gather device information using GETPID/GETBCR
and GETDCR. Mostly GETPID, DEFSLVS command does not provide device PID. Because
devices are registered from master controller driver, it has to lock the bus
for maintenance.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 drivers/i3c/master.c       | 6 ++++--
 include/linux/i3c/master.h | 3 +++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 5b3adb3..aea4309 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -38,10 +38,11 @@ static DEFINE_MUTEX(i3c_core_lock);
  * logic to rely on I3C device information that could be changed behind their
  * back.
  */
-static void i3c_bus_maintenance_lock(struct i3c_bus *bus)
+void i3c_bus_maintenance_lock(struct i3c_bus *bus)
 {
 	down_write(&bus->lock);
 }
+EXPORT_SYMBOL_GPL(i3c_bus_maintenance_lock);
 
 /**
  * i3c_bus_maintenance_unlock - Release the bus lock after a maintenance
@@ -52,10 +53,11 @@ static void i3c_bus_maintenance_lock(struct i3c_bus *bus)
  * i3c_bus_maintenance_lock() for more details on what these maintenance
  * operations are.
  */
-static void i3c_bus_maintenance_unlock(struct i3c_bus *bus)
+void i3c_bus_maintenance_unlock(struct i3c_bus *bus)
 {
 	up_write(&bus->lock);
 }
+EXPORT_SYMBOL_GPL(i3c_bus_maintenance_unlock);
 
 /**
  * i3c_bus_normaluse_lock - Lock the bus for a normal operation
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 3c27d9f..42bb215 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -647,4 +647,7 @@ void i3c_master_queue_ibi(struct i3c_dev_desc *dev, struct i3c_ibi_slot *slot);
 
 struct i3c_ibi_slot *i3c_master_get_free_ibi_slot(struct i3c_dev_desc *dev);
 
+void i3c_bus_maintenance_lock(struct i3c_bus *bus);
+void i3c_bus_maintenance_unlock(struct i3c_bus *bus);
+
 #endif /* I3C_MASTER_H */
-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
