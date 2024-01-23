Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A2AC47DDB
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Jan 2024 21:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cgasmW9ijEgA7zFlqa1b3pMr57AAMEMBu4szxA+RbCc=; b=0eIHps/j1uuk6c
	JmTU8qmtxACK92DDQdX95w5U2++56R8CVKpDLxD473ZFlveZGglAREXK45OALEQZJShFmpp8/hslR
	MEQ1yRuZULNItmVIPet3+TIMvwJbFxL7h1GCDWbVuANW6AhtFWyATEojvTegmf3I1JdkxLq2e1sLG
	eDp3FP78wLwDvbRWBax6sYvL02RTCEZzhsUBsflZlVdvbi1s+GPzdSRp4U0Z/inUx0YaRZRwGGiDm
	Nwfea6Hrr3MYvak5JZllwfm0mIV+3b4Jsdceuy7NRa/wCskJ10abGaAX4QrW/5FchJLj1i93BsyME
	KdAAX8iSJFjUDD+kBr2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSOHx-000WYv-1y;
	Tue, 23 Jan 2024 21:26:33 +0000
Received: from mail-vi1eur04on062b.outbound.protection.outlook.com ([2a01:111:f400:fe0e::62b] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSOHt-000WSy-2T
	for linux-i3c@lists.infradead.org;
	Tue, 23 Jan 2024 21:26:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PXpP0gMdccE2VYg3VphgNizWX61LeuFTM7/qxdm9IewJU+KS/4n1Qhpy2YDoOWTjHGfEnK2beI8TSXZw/MDFTxkFj/3yvbnJynkD1UOAN7r+fo6+oYjl0VjkKBZHjAQLkWHfv5i/Y2UHq7WycABoi4JuAqCDrg602EDC34Q7gWboaMDUMrqdAKO20ybuIqOp3hZwRm5sTVTny8qeUX8v4MpreGNAXZ4wbHCYBGI36TuqBfNABo6IFwCPt2cwSRAyTQSdgJ8vHP+PJvRu8mAmTK/CdR0MwtKLhrgzZhJWsj0PH3N+f4mXjxiAteFDl54wwCl7Hrb6XnHjBujB3ZYTRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8aOIBglyG61bEGb5olA/7j58q/P2SGycYr/WwqYlmo=;
 b=F6IooIXBeCzCBdOkmwnS0OPU26jwhHEuXHFLWDQbu2xZ5WNMwDpzZZPCXVUPAXtnqyCgYADndr99U4SYaMyF0Gh3u9ZPkVt+66KkEm2upS510IDw0rV/MWPRTQJ60fJudP4NOt6/BaGP6pvEX5lo4HhNBZfDKZnOU3OOMInR62nzEjqSnRkbMXPz2/jqZNhHA8Yjpkkhn1N0sU45GC0oKR5nuoNA8tc3Rw2hyEw107MJ5N6x//g8palAlW6CKTG1/JGU8NANj0lqUrKUmZl3XXog9H4EFiDtO3kuiT6zV83IuxrujEblSmgZMaD2i9HN5Za3iMlvheJRnGsHVhqeew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8aOIBglyG61bEGb5olA/7j58q/P2SGycYr/WwqYlmo=;
 b=dIMROn8uPGO7KqwRVUl86P9/HVhu9/2wKlt0rtVjPKnT31Tn74Ox3LWuZL5a9npI7BLHmkEndQpbjKMzv0LtLr+sfPM9lbDwnzmxMV/iCDJ1twG2MyX6/VIV9i8Qra+PVobogXuzZp1gjAQOu3ZiUz9bEuj7GSE1UryJ/ggwaHI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB7616.eurprd04.prod.outlook.com (2603:10a6:102:e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.33; Tue, 23 Jan
 2024 21:26:14 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::c8b4:5648:8948:e85c]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::c8b4:5648:8948:e85c%3]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 21:26:14 +0000
From: Frank Li <Frank.Li@nxp.com>
To: frank.li@nxp.com
Cc: alexandre.belloni@bootlin.com,
	conor.culhane@silvaco.com,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	imx@lists.linux.dev,
	jirislaby@kernel.org,
	joe@perches.com,
	krzysztof.kozlowski+dt@linaro.org,
	krzysztof.kozlowski@linaro.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	miquel.raynal@bootlin.com,
	robh@kernel.org,
	zbigniew.lukwinski@linux.intel.com
Subject: [PATCH v3 2/8] dt-bindings: i3c: svc: add proptery mode
Date: Tue, 23 Jan 2024 16:25:43 -0500
Message-Id: <20240123212549.3858137-3-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240123212549.3858137-1-Frank.Li@nxp.com>
References: <20240123212549.3858137-1-Frank.Li@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0081.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::26) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: fd5e5a74-6360-48e0-463c-08dc1c59edc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LQk6wdZ1XFoRK9MimEg7/EvaRDxnsaknfxNhdOrXNRUKqX7auDesiJguQDNi32XHxELNBsW9Xty+1aZQje1C6iGybUztjIALUKIIOBPjSn5OBhfEvm2FjURHREBBn9eYsmg8YVCxF1ifq2fO/9xG+IiK66SCY2AbsU7r7QF9NTe2m6YZ9PSDC10r9R+/eZE+XNYz2FEgBH644td6R0LOhx2yXjY/+WCR0Yh0eQalrJ3FWyifufskH4Gcia51kG6oZfZ73rk7/khgUc8RssL8jT9CT2mB8E0c/GiDhx4SzuE7ABeCAuxdDRj695FbKneTrk3GUilLNF0BdtqN6DjZivUdLU8bOFSLWIs7QWxn6o1b1Hh5o6wqfkBteUirCtNelteKSh3IDunLX5wwVjm21LI/0ogTRih5+qa4Sg109NiG56JEMKAbdzuKiilNRUOzzf7leJULvIx/zC9H5dAHSds4UHrjivF7F9XueHRQcVh99a1hTxVvQ0+PXR6iJ8cSYjPQ0nfdUasrZPnzVYLDpKmL955io87CIuX0xlXc9dYxHtDgcAyjsnMN8EnNBD7geqt2Y6ltFZSdxh0eh+AgWwWFmQDAfVfPPFkuNuL6VOs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(346002)(366004)(376002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(1076003)(26005)(2616005)(478600001)(52116002)(6666004)(6506007)(6512007)(83380400001)(5660300002)(7416002)(41300700001)(2906002)(6486002)(4326008)(966005)(8676002)(37006003)(34206002)(66946007)(66476007)(66556008)(316002)(8936002)(36756003)(86362001)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eQd6R20q9TOmSQTcXfM5pon9FP3bWHhiHW+BssjeUHBQ+p0+Vh8vd6gZjRal?=
 =?us-ascii?Q?O2ZGJxg3XyOUIEn4ygmnzFoUHrOIOwJFJblu2ZXnfL2VqZFT2YOpnLUxABeJ?=
 =?us-ascii?Q?CWkdUVJT4Z7pduiwGaXBa0KPmoNEKuqf1htrMNNLQVH0dl97Uo5J+w0UH9Pr?=
 =?us-ascii?Q?OmAYWBODGOYE9GmWMOMudyUeyibKyZAyFwOJgO4gzsN+NN1rz6tmPl7z+aql?=
 =?us-ascii?Q?xYKTBRL3JgdFg2UOedruH6KpJKYytPKqZbjZO893UW7utDyKiW8vAR/Vp7SN?=
 =?us-ascii?Q?QE2l88RJUmynVc4kHxnAcot8uGzLQqhNKVwd03eJgmInfIECpm1X4CCQz7v1?=
 =?us-ascii?Q?//caFvrrFfqJQ8057bflXr1WAmfcesmNgGkhaKKtPfntqZPdPOnpS+BcoHmG?=
 =?us-ascii?Q?PrR9aAKxJKTUmhs9oVWh35e7jo0a/KX9mopcFdAziWvDL65DVr0X8OPidg44?=
 =?us-ascii?Q?pcsiYRaV+xZsdK8CU+oOUa5KytbXxgGwDac+kJf5HteWfTls7hw1NBujAVh5?=
 =?us-ascii?Q?CVK68lrOkYY5Rwxk1SuPG3d9oFzyVA9kuji00cw71cgTYie++NpVERbet0xP?=
 =?us-ascii?Q?AqrpdBRztVbPvoMrQKvPliM0hbG67zALuEi9pVCHZ1vP7zVaorLdxXcFuwot?=
 =?us-ascii?Q?60DBTHhRh1CBbB+H38URYRBErLpS/v4+o5ymRrMRLXNSPnSL3GMWqn8hQyUJ?=
 =?us-ascii?Q?NTuPzWHTSxpyA0qWTe8JDPNURKtlNpzyej4+Hr4PLSfh+22bPVlj4Qq0EgLs?=
 =?us-ascii?Q?02tu8LIQXU96AcUkX3pKjrJ9BO1eoNNi3HAa3914zbH/JauQstG2MKNPyMYD?=
 =?us-ascii?Q?wVdEAv6RuhRQ1HlCJzdG813eVn6csuf0mBa2jxwg4j+ZzMwARRMzugSvHHgP?=
 =?us-ascii?Q?J65kCYg7jx9+SZgAnl1014U2KPtD0glht0bmF2Az/NXgUVlqV+LPH42dPHK5?=
 =?us-ascii?Q?uNZP1RUeD5LaSeBzpyLQpHkomlMJuzoSuwpqPQquxcDZiLW/QNdMsNnuHhaK?=
 =?us-ascii?Q?XFdJ1gfeEhhy4uyqCC/3GhyatoDo0LjqWjJekjnyuEOOEVRb6/93SMBf02uF?=
 =?us-ascii?Q?VWBhkrj28D4Nns+5/3TlvvElszcDGS3pzVzRKUv0vM42Ii7g/9K/Bq4uAdC4?=
 =?us-ascii?Q?wBiDAQUy7v8BvsumHSMmwNWD8rqtN7hvP8rddRrdyov8wktliYoJs5ORidWa?=
 =?us-ascii?Q?op/KK+ir6MPpxkJ5+IKPkBHFiExv934toURzbaVFuOb/BZYVA/FOBpJG+BPz?=
 =?us-ascii?Q?GgKlc9Mvoh7AvedeE58NEVQnqvJU7ti4jnFhHfN/uMsrmNSfY4MfbHqrz+hr?=
 =?us-ascii?Q?IIpIfNjP8cCpbRamrHx3e/yMqgcruFcPmpp5lqsu1SWqim5f3y8VcuyTg6/o?=
 =?us-ascii?Q?uDpDVJl/AnRUMp7pGamYehvhacE/qu3jcdAVdxi1oaQ3rsaMRj+w13ao5oPg?=
 =?us-ascii?Q?gOJSM1yFgfrjLZ5Nqszwzfi934ctR3o4QQnTbkHqgZ4dNhCM392siChEouA/?=
 =?us-ascii?Q?CrXuwc9KNFPLzHBlHGAMVKYlqE7OaRbxIsP+GSdSYNQ7rpXn6zKDa4djj+De?=
 =?us-ascii?Q?reXP3orCD3CzrFMy4xIQfQ7+soYFYukrAXzTnss2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5e5a74-6360-48e0-463c-08dc1c59edc7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 21:26:14.8206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8fCuX3TePickI3fhJ2UaTeQdUE+9nsf10blZUy5xXaFZBbJmnOTWgpQ2udMDp20VPrfG06QjIGcqPunUSUoG9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7616
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_132629_834606_DF1195C0 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Add proptery 'mode' to distinguish work at 'controller' or 'target' mode.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    Change from v2 to v3
        - using 'mode' distringuish master and target mode

 .../devicetree/bindings/i3c/silvaco,i3c-master.yaml   | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
index 133855f11b4f5..f2270a8b62ae5 100644
--- a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/i3c/silvaco,i3c-master.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Silvaco I3C master
+title: Silvaco I3C master/target
 
 maintainers:
   - Conor Culhane <conor.culhane@silvaco.com>
@@ -22,6 +22,15 @@ properties:
   interrupts:
     maxItems: 1
 
+  mode:
+   description:
+      Tells Dual-Role I3C controllers that we want to work on a particular
+      mode. In case this attribute isn't passed via DT, I3C controllers
+      should default to 'controller'.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [controller, target]
+    default: controller
+
   clocks:
     items:
       - description: system clock
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
