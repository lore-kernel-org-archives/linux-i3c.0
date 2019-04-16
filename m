Return-Path: <SRS0=s+0C=SS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B14FC282DA
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 08:36:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A9EF20868
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 08:36:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ViawTWHI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="A4RWMu3u";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="pIXUcVcv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A9EF20868
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1EJQ6XNXgK2IiCJa+Dwv8vO+KEoso1/tvcl2LD/6l9E=; b=ViawTWHIasnv76
	IIsdAYvDn8MzMnxV5pjPngzbrmc7klPue0uI5lTbww2XSz2nKoh1T3NUtv2jmIofC30Fkw3QKlVCJ
	sJIjFLezjEttaY8FqmuZX26dGr2UdC1nYMdO77+aM/BDanlVxocfjlHtlM8smpyS8UuXwvVG4YMVL
	V2EM+L8pXrLTES8mCghKoSCMYUh2lOdkQj9/0O/wjlrt6CELn9G0eCmTKqVEUiwikmcQzbEQAZFDu
	aIYM/xo/+0Jjh0+5nrZcTMtxyjP2fFEhfmzyomALusl+f/3P3ghvAsPKcSFMU5crwJYqgdXHUeUd2
	8cdLjRjeEIuZIfQXyU/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGJa6-0002qs-Ad; Tue, 16 Apr 2019 08:36:42 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGJZx-0002gf-Lk
 for linux-i3c@lists.infradead.org; Tue, 16 Apr 2019 08:36:36 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3G8TIcH028151; Tue, 16 Apr 2019 01:36:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=WaHEDkW2GLP/WDIQ14pqnjNBlC9Mpic66zsbSV3XaGM=;
 b=A4RWMu3u8NBWq3ASmx1vR3rCkLvwAhccMFE9dVtdQVRw/cKnUdttt+1uzqhx2okUG2Cv
 b17cgXvSSzjDdPJU7l1juix0HMfWlC2ic0seoDAMa4NMC7ddtB/1lHDLg/dek/2WTqp/
 p8Z9GhCJL2WfsgJW94oJvT04khbEcMPG4yIut6ICYYRuKDFP39L3kRkrO+xrGSlvIf5z
 xx5dD50HmktOdHFcb0lZ4ra0j4IoiB0ab+hzu8Y79rFpWhdZ8FjfFjxzZ9kZFrgHXcme
 fGydUSPa5s/Mh0zSD7OFU0rv6rXHi9oMpmQd6tsSal8dROrOmOi0o93UJtpM4rQmC5H5 VQ== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam01-by2-obe.outbound.protection.outlook.com
 (mail-by2nam01lp2051.outbound.protection.outlook.com [104.47.34.51])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2rw7d9h1k0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 16 Apr 2019 01:36:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WaHEDkW2GLP/WDIQ14pqnjNBlC9Mpic66zsbSV3XaGM=;
 b=pIXUcVcvt+nhFn0Or8qbpu1A7o6LCpSwJz6y3mAsc8klDQnVu1i0XNcCTR2nBRx4mt5trYKeQcpUy5VOS1NbNGFiY0HPfeoHg+W8q7dtgIWU8S2IPpDUC1GrZ38eaafCVHjJJ1TBnwvpu48cFU73gWK83p1eN515rktkKja92Tg=
Received: from CY1PR07CA0004.namprd07.prod.outlook.com
 (2a01:111:e400:c60a::14) by MN2PR07MB5821.namprd07.prod.outlook.com
 (2603:10b6:208:af::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1792.17; Tue, 16 Apr
 2019 08:36:26 +0000
Received: from BY2NAM05FT007.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::207) by CY1PR07CA0004.outlook.office365.com
 (2a01:111:e400:c60a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1792.16 via Frontend
 Transport; Tue, 16 Apr 2019 08:36:25 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 BY2NAM05FT007.mail.protection.outlook.com (10.152.100.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.7 via Frontend Transport; Tue, 16 Apr 2019 08:36:25 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x3G8aKGh020581
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 16 Apr 2019 01:36:25 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 16 Apr 2019 10:36:24 +0200
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 16 Apr 2019 10:36:23 +0200
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x3G8aNE2011142;
 Tue, 16 Apr 2019 09:36:23 +0100
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x3G8aNcO011140;
 Tue, 16 Apr 2019 09:36:23 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v6 2/2] dt-bindings: i3c: Document dropped support for I2C 10
 bit devices
Date: Tue, 16 Apr 2019 09:36:15 +0100
Message-ID: <20190416083615.6894-3-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190416083615.6894-1-pgaj@cadence.com>
References: <20190416083615.6894-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(39850400004)(376002)(346002)(396003)(136003)(2980300002)(189003)(199004)(36092001)(42186006)(76176011)(26826003)(106466001)(87636003)(105596002)(478600001)(36756003)(54906003)(6916009)(26005)(1076003)(8936002)(186003)(2351001)(50226002)(11346002)(107886003)(5660300002)(2616005)(86362001)(336012)(4744005)(446003)(476003)(50466002)(16586007)(48376002)(8676002)(486006)(305945005)(7636002)(316002)(76130400001)(47776003)(246002)(126002)(356004)(14444005)(2906002)(6666004)(51416003)(426003)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR07MB5821; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aebf824c-6d99-4091-d1dd-08d6c2469cf5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:MN2PR07MB5821; 
X-MS-TrafficTypeDiagnostic: MN2PR07MB5821:
X-Microsoft-Antispam-PRVS: <MN2PR07MB5821FFC25661C1A883961695C2240@MN2PR07MB5821.namprd07.prod.outlook.com>
X-Forefront-PRVS: 000947967F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 2GDTCg6DT0SH2YE+b1ql3JGqwlKG3ml/zu/b3A/2SwtB6U5frEbozyK2dpLElXDBtR5uXG/fC3lcozrvFYFiKl+WTr1NqQQuR9pj4nsureFGUqTVlC9ZOGZcTHoOJ1522XK0FI5q2gkU7CSLxQki6vpIOTXcu3CC9am8q+K/wokYRDW4u1dTELX7jO4q0NWu2WFupflwY4jbmpFX7Ux4Lsq/Sj+39PAKZ/200EZpbwREYlIFrH46BFQkNNjdm/UQDfKGLyMhJLmK3TYtAcumc54dFxemhlurFPtXKdD9bAecaJTi527jNcTS4pbG+OFBa7z5pbY7g1+iZk2rBd6NbGJQc4uobK9MjJC+XZj5UTkAdkMKjdlU01VPNFErNMKIqNy6HuB3e/J/IFm5QmleJ7V4ZHj8qHd1QISapliGOXY=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2019 08:36:25.5748 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aebf824c-6d99-4091-d1dd-08d6c2469cf5
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR07MB5821
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
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904160060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_013634_648564_EF0E2F77 
X-CRM114-Status: GOOD (  10.35  )
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

Because this patch series dropped support for 10 bit I2C devices, I'm
documenting this.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 Documentation/devicetree/bindings/i3c/i3c.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/i3c.txt b/Documentation/devicetree/bindings/i3c/i3c.txt
index ab729a0..4ffe059 100644
--- a/Documentation/devicetree/bindings/i3c/i3c.txt
+++ b/Documentation/devicetree/bindings/i3c/i3c.txt
@@ -39,7 +39,9 @@ valid here, but several new properties have been added.
 New constraint on existing properties:
 --------------------------------------
 - reg: contains 3 cells
-  + first cell : still encoding the I2C address
+  + first cell : still encoding the I2C address. 10 bit addressing is not
+    supported. Devices with 10 bit address can't be properly passed through
+    DEFSLVS command.
 
   + second cell: shall be 0
 
-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
