Return-Path: <SRS0=kfgj=2A=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F96C43603
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 10:15:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D94842053B
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 10:15:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Oqn+3DHC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="i7i4uVu+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="pDDAB95z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D94842053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DX7fHh+zaUvRBxjjIgynXC3tC/v5ICuFGpNEDRq4OzU=; b=Oqn+3DHCAy2l+o
	k52/zCnwK/fATAQGpSLdWM6v64OmUSJcd3twSoKGMEB6ldUIzljWaZWMD+X40Cb5C3oxWW+PFtM1o
	XaYFPjk6lfXu/IYu1lsk/A6EE6sno9xH/cw1JvpkL3aw5BAtMPR6OWRCPE3+DBLU4oACjuTOOvCQx
	O3uPQSMjgndNjNnl6uVlnHtwOuAANnHfNSuLT+5Szt1b/gh+O5Frw2kgSj1SlgS31SCKNk7ITy5GR
	pFgXHUheGQ3MYepSfFbJJBmXOf8kNXnQhC+3W8qpmHk9RvJAz+6OCU0Xq5CrNPZD5JAolGeBNG7xF
	jxOsbJpRlIkBcRmJzhnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iecYe-00086q-5X; Tue, 10 Dec 2019 10:15:56 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iecYa-000866-KY
 for linux-i3c@lists.infradead.org; Tue, 10 Dec 2019 10:15:54 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBAADMkr025733; Tue, 10 Dec 2019 02:15:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=jaZGmfWsFPbrET/I1a85oqYsC7ry6HboZ0lDypFg0kQ=;
 b=i7i4uVu+h7ZeCmoY6m2AJyB7epn+R2+jH8zmnqTIR09bjvdGXjhiJgrRi73BYX5vtdyS
 xYdSAy+s0OvQ/AV1WBfwU4V0iiDCTxfUPG9EkzJvLItkNs9kldRNcplaiscVC5BeaiCw
 Rb35Ar2TLOGWzgrsEYHz27NoOHSKX1pNYQUqlOR/gPXtCV2kRNeAhTyvSJNzhUma6JJG
 ymT9ythV7Sf/awBwyKJCILhnqEu3VWFk88LnYNxV8G2bVq15cUM0VLnR21/kJ7Yvb/mL
 /ykchL1ISk8VPOWx+PABnOv/dSHX/pUtoB+Ic7bpqSkt9n+3erhntQLYKYKXXDxlIXGm Zw== 
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2052.outbound.protection.outlook.com [104.47.38.52])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2wra709bnu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2019 02:15:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mg2b49Cb90ttH+a6L51uwmARhYL7yEEpMv/KKmwQY3ruLb+4fWCyqAc5BHdfkmW42RHrHI9d7CvNj5LQfctnawOgtnKsSGlTn0uR+xJdPBfySiPj0GXTtHenmmiVMt6LR7ru2N/2is+3ur5kS6lRMaGcU6L6Emf72jeknW0uWa/LUErwfylzDUUPUIyi6RyCqTdr3Ls9qH5PwLvPlhCaOpq84Hc3SYRunuDXvRd8cpzTyQk2K91NhtnkCGqESqupqFo+A6gohjSgHpIuLOffPXfZu1C8IwoRn0eSj4lbnHau+OOP4nr4XYSFY1PDsCilTvQ8rEnIxcIuRLXhNmUqvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jaZGmfWsFPbrET/I1a85oqYsC7ry6HboZ0lDypFg0kQ=;
 b=Y3+rx4/UMC5Rcxbp5b0Uh4aZccvbgWGr+unnblvpdeTRIhDzlToBWEsoCfnTDMelGF7MRFVUd22Jex9yq003nFthTHhBgLoIhAuGoSMo5aWA0i5XpltAsX8dja8ycSjUbkTgKJYxIY+szjYXPjIoWkNWgd2BJk4pLFMtm4XZuv6GkM9blh6EOMZC6W2P4n566MqYzqVrZG93xRH2vJAk9gaDSN4erNw77pENVOBeCZOcfaS1sUsyNLxQKnDRAicSu1eStjA0zp4Er7cqhcaKOIdMGxTXL95i4s4jR4fnamC8NDLnWBAOv2+jX3gbJcIiPNfARFtAextW3k0W4TuVeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.207.220.243) smtp.rcpttodomain=kernel.org smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jaZGmfWsFPbrET/I1a85oqYsC7ry6HboZ0lDypFg0kQ=;
 b=pDDAB95zJJSe79ZJzG637GKAj2Gqqf1CeCNw9zlhfkOCgohhf5R0E7qgGYRkstJMCeHs4FsmOk58tpj/19C2wyTKrjA7ct33yy4A0gMfx8EnSzIBL1t/bQnxiNTCvcEd/CO70FNC1ViEaVUo46GRH1ic00lruxnJsETsAgkIWTE=
Received: from CH2PR07CA0016.namprd07.prod.outlook.com (2603:10b6:610:20::29)
 by SN6PR07MB4463.namprd07.prod.outlook.com (2603:10b6:805:5a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.17; Tue, 10 Dec
 2019 10:15:42 +0000
Received: from BN8NAM12FT051.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5b::203) by CH2PR07CA0016.outlook.office365.com
 (2603:10b6:610:20::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12 via Frontend
 Transport; Tue, 10 Dec 2019 10:15:42 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 64.207.220.243 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.207.220.243; helo=wcmailrelayl01.cadence.com;
Received: from wcmailrelayl01.cadence.com (64.207.220.243) by
 BN8NAM12FT051.mail.protection.outlook.com (10.13.182.230) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 10 Dec 2019 10:15:41 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by wcmailrelayl01.cadence.com (8.14.7/8.14.4) with ESMTP id
 xBAAFZPM102957
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
 Tue, 10 Dec 2019 02:15:38 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 10 Dec 2019 11:15:37 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 10 Dec 2019 11:15:37 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xBAAFbDk009306;
 Tue, 10 Dec 2019 11:15:37 +0100
Received: (from pgaj@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xBAAFbCX009305;
 Tue, 10 Dec 2019 11:15:37 +0100
From: =?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v4 4/6] dt-bindings: i3c: Make 'assigned-address' valid if
 static address == 0
Date: Tue, 10 Dec 2019 11:15:00 +0100
Message-ID: <20191210101502.8401-5-pgaj@cadence.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20191210101502.8401-1-pgaj@cadence.com>
References: <20191210101502.8401-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:64.207.220.243; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(396003)(36092001)(189003)(199004)(1076003)(86362001)(107886003)(42186006)(316002)(36906005)(5660300002)(2616005)(70206006)(8676002)(186003)(356004)(6916009)(70586007)(6666004)(81166006)(426003)(2906002)(8936002)(36756003)(4326008)(81156014)(336012)(478600001)(26005)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR07MB4463; H:wcmailrelayl01.cadence.com;
 FPR:; SPF:Pass; LANG:en; PTR:unused.mynethost.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71ed7941-c919-420a-7e40-08d77d59e960
X-MS-TrafficTypeDiagnostic: SN6PR07MB4463:
X-Microsoft-Antispam-PRVS: <SN6PR07MB44631C3FE3225FED9F672350C25B0@SN6PR07MB4463.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-Forefront-PRVS: 02475B2A01
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kyzRjKAqAyL5gk77HehV+gUVCZpe+5JDP0+y20f+HQie2j31roQ1p2+pqqGu1qY3dUuxaarKET6GcC5ipmGcjO2/7jq9okKDwRSlQH4nmIpE7/aZNWummYnH6XUIe2l3sfchyQPxGMRys1rfGJXGZZ+2nr4TLKPLh9Ippld3wznBmGStDGZHZi4g5yI8KqT2j1Jjan/jsnzsE+sdJA3LP2CssjD5SeN//oQBbFosuE0HjaEqQaNBeLFzUqMhLczYh06zIxa4/pvkvlzrXr10UgFHBbl5vTHK+tY7+CLeLdzY1kieuofQf8I78urNY5r8HdLjquTcJ56CWab/oRoc4dMvmMlsgd9L09NVi/LrXeoX+pKCWWuIhcbDFGB/gp4Wb9NxqI+2UOpj3Ty3cyekxVBB2JbvX3e518Chjv4fboshAmALFC7xIjTXi/QzT9If7IYbBPpjeQs2qblEVcf792FI+cVF8kuEeWt3++GxHTXJ5aIAxEf/l7odD9wI2GLS
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 10:15:41.3815 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71ed7941-c919-420a-7e40-08d77d59e960
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[64.207.220.243];
 Helo=[wcmailrelayl01.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR07MB4463
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-10_01:2019-12-10,2019-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxlogscore=999
 suspectscore=1 malwarescore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912100090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_021553_182886_68CFBB65 
X-CRM114-Status: GOOD (  13.36  )
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
Cc: linux-i3c@lists.infradead.org, Przemyslaw Gaj <pgaj@cadence.com>,
 rafalc@cadence.com, vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Vitor Soares <vitor.soares@synopsys.com>

The I3C devices without a static address can require a specific dynamic
address for priority reasons.

Let's update the binding document to make the 'assigned-address' property
valid if static address == 0 and add an example with this use case.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
Change in v3:
  - Add Rob rb-tag

Change in v2:
  - Fix typo in commit message
---
 Documentation/devicetree/bindings/i3c/i3c.txt | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/i3c.txt b/Documentation/devicetree/bindings/i3c/i3c.txt
index 4ffe059f0fec..7fee9b4dfba0 100644
--- a/Documentation/devicetree/bindings/i3c/i3c.txt
+++ b/Documentation/devicetree/bindings/i3c/i3c.txt
@@ -100,9 +100,7 @@ Required properties
 
 Optional properties
 -------------------
-- assigned-address: dynamic address to be assigned to this device. This
-		    property is only valid if the I3C device has a static
-		    address (first cell of the reg property != 0).
+- assigned-address: dynamic address to be assigned to this device.
 
 
 Example:
@@ -129,6 +127,15 @@ Example:
 			assigned-address = <0xa>;
 		};
 
+		/*
+		 * I3C device without a static I2C address but requiring
+		 * specific dynamic address.
+		 */
+		sensor@0,39200154004 {
+			reg = <0x0 0x6072 0x303904d2>;
+			assigned-address = <0xb>;
+		};
+
 		/*
 		 * I3C device without a static I2C address but requiring
 		 * resources described in the DT.
-- 
2.14.0


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
