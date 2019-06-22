Return-Path: <SRS0=3/jM=UV=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A6CC43613
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Jun 2019 20:56:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B63C920657
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Jun 2019 20:56:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NNsNTLm3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="hiPzaUp9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="aKFE+kbI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B63C920657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fDMJ+BxO4cPNhsskfnEao8iKEhBVNIKX9bWE4EUjNg4=; b=NNsNTLm3lvwe7F
	z86niPd0ihWrGMvJrCRpjFnCfSANIpsee9f+tgifxa+wjeieUKbPyiT5DfJehQeU0nSZ8Ym/Rhggk
	9e9+/a8nqoLcobE5Cm4L9ylbUt6rvJH0AQbIE6Y7cCc5U8wfkbfWK+MwHvfPwkFUgNBwBdKCURm7V
	6CaBniG6uJ1TiTgvQUisnrg5ZGVCea/eQsCRdvOKkhv0ySjm7Cd5Zx+ohe6xNp/OdGwxuHWjuVQsV
	zNZIHA1Lye4ISxJQlzmyfgo9FkZiJ/IKeWPtz+U7/ACJSLouB4QF0Wxa4rdDbmemEssC95m4heal1
	0CRCjiycwvpS99xfyMkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hen3k-0007DW-GK; Sat, 22 Jun 2019 20:56:28 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hen3h-0007D6-KP
 for linux-i3c@lists.infradead.org; Sat, 22 Jun 2019 20:56:26 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5MKq34q029693; Sat, 22 Jun 2019 13:56:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=GEOvZSpQQ6T9ppq9FsfXHioh08Zk2rtfckntDIWr7BU=;
 b=hiPzaUp96/s3LHnAzAO4ce9S57fxMIwSvXJVNwo4H7MUcx+TGed7i32Ie47lWMayhiAh
 wdgrHVL/oLBm43fCrY8BCAdvG+olk+D67b8jMNwC7T+OSkxfUxiM3Myg6BMzPVfYcIIc
 O4DZiH0VI5NOfM+hkN+lLAJ25k/NTSSB1m1b6YCKVhMtDyt7RqnyG/VKGAqrQVi8AEqF
 dTmsLkecRnkHSFedCkJDFLnePicoQM1BgwCFSGiHQY9zf/seIDUKIyyaC3HRKDGGWXiM
 0EC/mSL8OUYQFeUvMz81kgx/Dhb9vmIqyEkY0I9AUtbbtKGfNihEgcn5KWi0th8RsGMh 0Q== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam03-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam03lp2059.outbound.protection.outlook.com [104.47.41.59])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2t9gvs1cfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 22 Jun 2019 13:56:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEOvZSpQQ6T9ppq9FsfXHioh08Zk2rtfckntDIWr7BU=;
 b=aKFE+kbIbv2F0prHpel9YKFyqSRzg4GtUPgnbODgNa6gQbCOEpBAbHDsfzL8QqF3GTAhjAyv/ZcupEk97eGdcWsZKCh57yi9HFGcqSEdLe8yIdwFHsamigk5lDQM/KfwkDGJy8tNPmGY++plOPo4Nk2vdLU6FbVvyGIIyoESLBI=
Received: from CH2PR07CA0006.namprd07.prod.outlook.com (2603:10b6:610:20::19)
 by MN2PR07MB6975.namprd07.prod.outlook.com (2603:10b6:208:1a8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1987.12; Sat, 22 Jun
 2019 20:56:20 +0000
Received: from CO1NAM05FT044.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::203) by CH2PR07CA0006.outlook.office365.com
 (2603:10b6:610:20::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2008.16 via Frontend
 Transport; Sat, 22 Jun 2019 20:56:20 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 CO1NAM05FT044.mail.protection.outlook.com (10.152.96.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2032.6 via Frontend Transport; Sat, 22 Jun 2019 20:56:19 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x5MKuH60004251
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Sat, 22 Jun 2019 13:56:19 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Sat, 22 Jun 2019 22:56:17 +0200
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Sat, 22 Jun 2019 22:56:17 +0200
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x5MKuGhT010341;
 Sat, 22 Jun 2019 21:56:16 +0100
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x5MKuGVe010340;
 Sat, 22 Jun 2019 21:56:16 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v5 7/7] MAINTAINERS: add myself as co-maintainer of i3c
 subsystem
Date: Sat, 22 Jun 2019 21:55:05 +0100
Message-ID: <1561236905-8901-8-git-send-email-pgaj@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1561236905-8901-1-git-send-email-pgaj@cadence.com>
References: <1561236905-8901-1-git-send-email-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(376002)(396003)(346002)(136003)(39860400002)(2980300002)(199004)(189003)(36092001)(4744005)(2351001)(5660300002)(70206006)(70586007)(48376002)(76130400001)(356004)(36756003)(6666004)(86362001)(50466002)(7636002)(107886003)(305945005)(4326008)(478600001)(316002)(6916009)(42186006)(2616005)(486006)(87636003)(11346002)(26826003)(2906002)(246002)(476003)(76176011)(8936002)(47776003)(336012)(8676002)(126002)(54906003)(50226002)(186003)(426003)(26005)(51416003)(446003)(16586007)(42413003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR07MB6975; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.Cadence.COM; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e28c043e-83e7-4f3e-9839-08d6f75413c9
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MN2PR07MB6975; 
X-MS-TrafficTypeDiagnostic: MN2PR07MB6975:
X-Microsoft-Antispam-PRVS: <MN2PR07MB6975A0A162AFB4076EBBFF6EC2E60@MN2PR07MB6975.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-Forefront-PRVS: 0076F48C8A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: agposulAhEmjZIVx/3c7WDAS4KKIwCp9TMAkU8gvorwu+6bW1hfkEDtUYA/R0QCOuSz+Nr7ZjmIJXmae2MxQn0F6qzDSZQb/WTtFQr9Y7AePXV0PfgbiHYupbON4IvGFNH1Tprn2ZCOYEUZowFMFPyJE3N0cxEOFGZwqZ6JCUHj+E1jslKIX43JvTqW9sVfFu/nimcClvaww2HzsIHi1Hm7U9yG5/czKyY9N4qTYhcsCcZ/bUtN93dnroEcmavzt4SPXi0NJTe+4piAmRgJ8DKdldRtK8H6QxLXLln+vDvmS3fFp0rjiDkZt5s2326ipZm4aLNraLNxp1Nl7W0cOblEPAShicHvTGJIYZhtYczSOw3LV5NbywOOyUdLuejh/6+W28eGCAwczkzFZUOVKiR10T2fDAGYMYusU2KKI7wA=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2019 20:56:19.9365 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e28c043e-83e7-4f3e-9839-08d6f75413c9
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR07MB6975
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp
 include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-22_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=923 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906220190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190622_135625_777470_67A5146A 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
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

As discussed with Boris Brezillon - I'm adding myself as the co-maintainer.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dce5c09..a5003bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7175,6 +7175,7 @@ F:	drivers/i2c/i2c-stub.c
 
 I3C SUBSYSTEM
 M:	Boris Brezillon <bbrezillon@kernel.org>
+M:	Przemyslaw Gaj <pgaj@cadence.com>
 L:	linux-i3c@lists.infradead.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git
 S:	Maintained
-- 
2.4.5


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
