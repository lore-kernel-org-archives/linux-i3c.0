Return-Path: <SRS0=s+0C=SS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50089C10F14
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 04:42:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20DAC2086A
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 04:42:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XY3WZBUu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="APOumdzo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="aoL6pEMv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20DAC2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1EJQ6XNXgK2IiCJa+Dwv8vO+KEoso1/tvcl2LD/6l9E=; b=XY3WZBUuM7SMSv
	ycfKjKiCt9kqlbbjufj/D7wkOwxyDZbVluIph9gkoyVK7HEjXG2Agz51bsXNRh+y0JeSlfuFiOvfE
	lP6WmzamahqyH/hg9FGBFeIwSrOnZxksAVJQBIx4AY/JIIZoJR9wU4A4/+vmWqmxcG8cAWIVHIs1V
	T0TmG1hLqJ33H5uQlbv5kqj4nHapBvzmapye6NygZGKbXrPDA1DghdN0SEETed7cHNKEP1J6v3cBw
	afN1JjrkuszyLZYP67RfzI0714YP3ODbNUD9+s8EI53/E1gxWcaVV/cQqs3yvjqg4lGuI20C6u1Ql
	u5+YwH/cpa3Zt6STwe+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGFvE-00087G-N7; Tue, 16 Apr 2019 04:42:16 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGFvB-00085p-D4
 for linux-i3c@lists.infradead.org; Tue, 16 Apr 2019 04:42:15 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3G4bLa4016537; Mon, 15 Apr 2019 21:42:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=WaHEDkW2GLP/WDIQ14pqnjNBlC9Mpic66zsbSV3XaGM=;
 b=APOumdzora09McHwZT3LCVePCwh7cxQ68Y5B7euFVVQXWW9yAdNEb0FdvoqGL4M2sAoM
 MEy5vPXBsd2iqulqAmFllDPNyAu8f59gfKcU2ytLBhrrwUadTMXZFD90I/yDybCgGpwQ
 59t2PbGTZ6MgVUJvzEVZsiPkk/bAFE+zWaIeONpdYreH9kwe+FdZF++ARKL0FJwB0CHz
 FjEX3RIa0C71wP/ZfLLy3LGukex5AKnib7RcJ0l3YpiODca0r31kzuFa1nayJbCJvubu
 L+dbtFfRwYM/HgfDUUQycFX99HCs/7YKRLUClBbMwp91hiMcpGC1R8cyAuOWOEGjbtNs 7w== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2055.outbound.protection.outlook.com [104.47.36.55])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2rw74gr93u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 15 Apr 2019 21:42:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WaHEDkW2GLP/WDIQ14pqnjNBlC9Mpic66zsbSV3XaGM=;
 b=aoL6pEMvpOAPuMtCmGXVHu1k07kRrDnfaE+VWIyyH46utNxQjiXfCiuGE/osrJODAXLZMui+vnJjPUx61O7QYuUr/LygBKIa2oZt5fnLi7tUz6gru2r2eoIkKkdpJYHyHml/wboK/6b2x4Ue7dPEfrE42Yu0zh2b0P0u8pzLtcE=
Received: from BYAPR07CA0030.namprd07.prod.outlook.com (2603:10b6:a02:bc::43)
 by BL0PR07MB4098.namprd07.prod.outlook.com (2603:10b6:207:4c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1792.17; Tue, 16 Apr
 2019 04:42:05 +0000
Received: from CO1NAM05FT014.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::208) by BYAPR07CA0030.outlook.office365.com
 (2603:10b6:a02:bc::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1792.18 via Frontend
 Transport; Tue, 16 Apr 2019 04:42:05 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 CO1NAM05FT014.mail.protection.outlook.com (10.152.96.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1792.7 via Frontend Transport; Tue, 16 Apr 2019 04:42:05 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 x3G4g2Fw020168
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 15 Apr 2019 21:42:04 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 16 Apr 2019 06:42:04 +0200
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 16 Apr 2019 06:42:04 +0200
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x3G4g3Le003692;
 Tue, 16 Apr 2019 05:42:03 +0100
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x3G4g3mx003691;
 Tue, 16 Apr 2019 05:42:03 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v4 4/4] dt-bindings: i3c: Document dropped support for I2C 10
 bit devices
Date: Tue, 16 Apr 2019 05:41:46 +0100
Message-ID: <20190416044146.2382-5-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190416044146.2382-1-pgaj@cadence.com>
References: <20190416044146.2382-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(136003)(396003)(376002)(346002)(39860400002)(2980300002)(199004)(189003)(36092001)(5660300002)(126002)(47776003)(476003)(76130400001)(2616005)(6916009)(316002)(305945005)(107886003)(246002)(54906003)(48376002)(106466001)(426003)(486006)(50226002)(336012)(105596002)(4326008)(16586007)(42186006)(7636002)(8936002)(8676002)(26005)(36756003)(26826003)(186003)(6666004)(11346002)(356004)(51416003)(2906002)(86362001)(2351001)(446003)(76176011)(478600001)(4744005)(50466002)(87636003)(14444005)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR07MB4098; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd41048f-4a46-433b-f411-08d6c225e05c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BL0PR07MB4098; 
X-MS-TrafficTypeDiagnostic: BL0PR07MB4098:
X-Microsoft-Antispam-PRVS: <BL0PR07MB409859DBA1AF5E0822D6FEC2C2240@BL0PR07MB4098.namprd07.prod.outlook.com>
X-Forefront-PRVS: 000947967F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: fa7L5SdH/tFFvcbwUmLM7+reolwmLM1QfTdzO2BtDdMOcsvXHaqXrmRzeEP7L7AZuMkCU+gIVywPX14mOODQr80ZaK9slrKKJY01n789JkwgkOYLI8BaPfp6okt2S0DkyG9BlepJFIsZKkRaFoVT5UZDMArmrNRPZ6ObVcRlRRr4hpxE+1x+ixwWC9KCo4HvI3HzvTzwr2SnZNTZMKWohdOFXeT5odKmr7qTomlRUHW5tc52eoHQdce31Lf91mN3drucr4lYVDDh3MDPCMghILE5tPPLwvAgRA4QuCSYKA6/BNkIq1OP8S2FhWlr+TcUVk0lnkaa2nDB9u+MeGD8QqjSPlVqJf/9KlTU5bUkJOFA2zbTVBjbWaRzkA70jTOVNChtXX+0o8RQeTFPCRdtrHlhBDk60OFpT/5BPZvHOB0=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2019 04:42:05.1829 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd41048f-4a46-433b-f411-08d6c225e05c
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR07MB4098
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
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904160033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_214213_670278_3E204A07 
X-CRM114-Status: GOOD (  10.82  )
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
