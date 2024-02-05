Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58760C4829A
	for <linux-i3c@archiver.kernel.org>; Mon,  5 Feb 2024 23:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WfFwaiRVhFdRpswGxCKtxlCPdT0hgtUbuhjPu1sUo4c=; b=XqZKrNpBCXJAX/
	2WpwKgY7bxEPe5bLN0R9LETm4GL5nMv7hYYeaq5kAqVj9jjaRh85h8PVEBOUFNm4xByGyBGhodgCV
	v2GMkuTUaHISADVTAbbWpwltX/Amk/4DzEIfBAn7jOSs58eubUxS919KUly58XXu4JcQMPfW/Dlk8
	rU0BXOfj4xPzWMO1xF5JuCbE6QY+R+wg5PGLrdZahx0VcGuER6hKYdpIEiRUhGYnCOHJmOaY0vX4J
	sjFu5gon6NFzVbxW0RRaUsvjJtcgNz9BTRuHpK2FnFPdxBswMEkoewuuqu6f4xHYXqJASDCqDB2Sq
	Ms/wIobmutLnpWeN+YgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX8TR-00000005Z0R-0BE3;
	Mon, 05 Feb 2024 23:34:01 +0000
Received: from mail-he1eur04on20600.outbound.protection.outlook.com ([2a01:111:f403:260f::600] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX8TN-00000005Yxf-4BdB
	for linux-i3c@lists.infradead.org;
	Mon, 05 Feb 2024 23:33:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XX2ZJ2g0EA4QwZvkEYyyHuzG7lpD5QJRRU1X/fe01T30nk8Wso/VPx6Cq8YuLLKHuA6FMYx7M0g7mD6QYe1SXMdI3dyMu4ceJlw1KOyzGKvgDaIs0pCLxFDg9dvXyjem6xRX2ookwXSqMT39uTGXigwp2GiD067KG3Hf+H6YGYwaQmF0yYYSdSFT2E2fXuUlNHad21C+AIO7NM1nBYO4Q/Db0NnGixnh2BGuWPWDIV5wfUvwK/fmULx4TdMryQrhHGYbOMSlGur3itqgXoyWu4+jCAyQcO2k7w5u7r7iTY8c/dlUC6GTjVAaHw5sxFr/q/EI7ii6cyp6g+EksDtoPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDK4qrtnr5XVTe+ocNEiDTpD8I6wdwaixxJbj5SM/h4=;
 b=Qfet41AycPNbzFDWHxcpmGK4UmQeZB2nM3PmhJK8vz4GSBjSFjRGlA6GSyP83lKPJlzWiIrqknmGDmzqJvDHWGb6xt4Yfm8iCSRXDUfIngv04foox2ZGAszmmIrUGVH4uePm6Dw7torJvYIRzDOy2KuqUcXOwyfecU0H8ldSsZ425if6W9TDSx76v167f9otDj9jrxl9mgt+UJxLvWq+L1gANQRZI2A1qhGRSJO3gcZuT8AKCX+djG6Mk28UtRIdGM2y+ttxTfm/bHVvfEAy/Yfl3nxcFhk0vI0Qzenne814P7t4Uiob3+fuz7EPTVCOAHNph+IH1T6RfKohdps0zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDK4qrtnr5XVTe+ocNEiDTpD8I6wdwaixxJbj5SM/h4=;
 b=UqOeFxqO7VSlTji4/ulTK+o4WVWfEONvgYFIga8/6sbHcDVOBl1NJGaufky611QO7IFTRxZoeqbGAqdx7K8gJWxA1bXXMy0o1LUPWZJuBpyRory41uMFgjeG4ZhbIcxhk7/77IDTv7NUcpTg9/m1KREJHOaxrBNoaj8SvBu3dhw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB9205.eurprd04.prod.outlook.com (2603:10a6:20b:44c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 23:33:51 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::c8b4:5648:8948:e85c]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::c8b4:5648:8948:e85c%3]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 23:33:51 +0000
From: Frank Li <Frank.Li@nxp.com>
To: frank.li@nxp.com
Cc: alexandre.belloni@bootlin.com,
	conor.culhane@silvaco.com,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	ilpo.jarvinen@linux.intel.com,
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
Subject: [PATCH v7 2/8] dt-bindings: i3c: svc: add proptery mode
Date: Mon,  5 Feb 2024 18:33:20 -0500
Message-Id: <20240205233326.552576-3-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240205233326.552576-1-Frank.Li@nxp.com>
References: <20240205233326.552576-1-Frank.Li@nxp.com>
X-ClientProxiedBy: BYAPR02CA0005.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB9205:EE_
X-MS-Office365-Filtering-Correlation-Id: 10b693d3-5110-4fb7-9e1e-08dc26a2e8da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LiSXNcTlc6D+PR4XXoYqAyf+JtTkQWtRedua31g9Ryq91X2K4PZHO5YOjov7FcbebirgxS1FXYZgLQ90utYcJtlp4RpfHPSSSufroVZDk6zQkYycZAdiO5aT6uqpqAAE1mWxVdHldQIogCHQbPhCFYYk3Rwpoz2GOmMm1Ry6MeoTEmN9ROy6JcMpPuSd5OoakzP/skjRg3v0pvP13qOuPdFqrM/y//FFuMzyM6JBzNv1PBNxTZp7KV6PlRqVVc9SsrCb+cZNqy//fTHMwsRRtc/liY9Dk4boOY6cI4NmaMOXYlghYuqaLV5Q2m49VnAV0sRog8KCfghCBV+DcavlGRf19Sj5nQwyYp6a1PtGJReFXP6tR6hIlulUQ+M+JnzBsgPnhAqz5gCWxeax2QVWH5HoVpXJDZM424Un3Ik6YkwpGdnolse3OJsIXSMMsTl9HrgW9A+H6DXp0h+GM6bCHGSwQKwkVvjz+M4eJwQtS1JSxgdCK43e+iwD0HeKfJGSYOM/eQHiDNIroiWRfZ9WKUBFz3UGlzdKtvYm/NFKdQ6mAMrWYpw0GVt6oNzeQyL1xo6j3m9Fqa7hA3uLv1t8dmFqhF077S7F4dNEd2WzrLI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(396003)(376002)(366004)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(1076003)(2616005)(26005)(86362001)(41300700001)(7416002)(966005)(6486002)(5660300002)(2906002)(38350700005)(316002)(37006003)(66476007)(66556008)(66946007)(478600001)(8676002)(34206002)(4326008)(8936002)(36756003)(6512007)(6506007)(52116002)(6666004)(38100700002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kp1pyfUcrFekckPeSiVTDelp4dALrtAsFQG1VnftTHhW5Z/uH+13KkWqy0aL?=
 =?us-ascii?Q?k8I7N2Y1L/9goZJ8LMCe9tg5lRJcswyhdrIRirCsJG+ohsF7Itd7IlWgS4vA?=
 =?us-ascii?Q?+xlDI40gnQGWWopYvY5HooElNehI6bZ+ZuOw/LMssAHPYxa3Scu5nohjZzEg?=
 =?us-ascii?Q?S2kHGAg2BStFkQ2b54EDQWqdPNeFbaE9/B0Mih3iKXtcPgvjj4QKPXTM98kw?=
 =?us-ascii?Q?gszTegE0Gh2QtjBt/uFu3nqUnE1g/+0SMoQOfHryd/Pu7zQ7KpJXUMyMO5NV?=
 =?us-ascii?Q?7Q0NsBqjX5YNbi2gbgxBTKxe4sSgJUqJsg2IUDji54OLrVTk/LZEzSg939zB?=
 =?us-ascii?Q?KExJw2yh/t33YYUEugRKj/215ycn+0Rx4u5XcRKym1nzm8wW3M+/svn6BI7l?=
 =?us-ascii?Q?QJoN7c5X3vNdmJ7l6gwoNhiUOBYTPW0eX0E8MtF15/My8yhMSaxkBPUR3yp8?=
 =?us-ascii?Q?DhMWZY9UAp/9myVpKB3aWXf5MjWHgYPaqBDxpOnXwUIS+i/8GO5Tl8d0q3Ky?=
 =?us-ascii?Q?C6ctwHWlmx6BB5v/kTP8XmZq2anCpfRz2+hETWwgg6AABpJMNLCAXiW7cdG7?=
 =?us-ascii?Q?slL77bSF+CxSqXqHi/0EXx45mIoKGWduu1EF9Jy5BBdDdQ5NExoUF3Xz8kL5?=
 =?us-ascii?Q?DT2givTs8X6Bt2tfT1VKB5DEz3zQQ/aFgMQ6f/gA2ftx/BsJogoE/UYcWvG8?=
 =?us-ascii?Q?fw4wb8oMZ94IClwU3bsvF+FqnpowoACSdTEO8vgQd2DXUeuJ9st1mZdIQq84?=
 =?us-ascii?Q?37xKl8I07UZoy0QBPr+MgxqlIhXX+e0Tr6WgcaoFlImuENBgB/EfZ64Asku/?=
 =?us-ascii?Q?tw94na52+MjwyGXFqHxGydVmP0Alys5a4hp7hO5+Amour6mU3RyaUvTq5o3g?=
 =?us-ascii?Q?kMgXg0kUQ4rEmufqbC5r1dXC6MUKw3oGm0yixAPpVbNp8hPOw9L2lHJOl3rn?=
 =?us-ascii?Q?9G8Ho4Z0q1m9QGeWr35wpvhZW2YZpE4KTRVfteZ88B9ihlK88JhyNCD2tDWw?=
 =?us-ascii?Q?pBR+KhJ7i3ytBB5UwlTIH0F7HrEB1skr47b7TLfStcMQCx5sQ0LWP91VRDAh?=
 =?us-ascii?Q?uHYgYGcZStIBO/U09sEUA1UlZsRD1v4GWzJjwnxRcNwJnttLTVgSiNsdcRLP?=
 =?us-ascii?Q?murorJ53qsOoUx6fUqhcm8n2LAHKfUApLZD3p+PPVN3umluSLRgmVpTDO4os?=
 =?us-ascii?Q?EtYk7Cg/5g+ciCC2Ip1yNVnT3v+LKY1IFsO0wKM6eg50RoEeel+K7wH4SsCr?=
 =?us-ascii?Q?AL2d0D3QQeLDxBVhvcZ250L3ConnN4hHgyStsqI1i6SGr4BEGlLnMtjHagog?=
 =?us-ascii?Q?F1CV5p7bF71r104QAMrxGm5/LxSiiUJceNHQhXsnDwnLjrrtbDMtFnXwR0FG?=
 =?us-ascii?Q?BeQkLchwNP9jkxMu8+2WXeLO9nDIIXZNTqgE6nWwaWczIi9OAjVF4CCUb6Gs?=
 =?us-ascii?Q?HPRVxcNHDJsltrdaOTFas0vVaioL2qlYcDNdQcP2LrCT+9dumgjk64TCrpC0?=
 =?us-ascii?Q?xk9CiWZc0W0FSW6C0XYwuF2LxU4McxpMed3vKTQZKImSFbTSiaoPYmKjbckR?=
 =?us-ascii?Q?/ne+TQjhYD+g+Of0UJyd2Pg4vxkXvXwXam5wUWqZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b693d3-5110-4fb7-9e1e-08dc26a2e8da
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 23:33:51.4166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hvRVyB4tySjlPFox6Bm2L+HRmK5NB2suyjrHC+fCkawq612JRSkgT49Zruz/o3UW03Y3tpxy3aFNjVWJ5nV28g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9205
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_153358_061715_FF166EA2 
X-CRM114-Status: UNSURE (   8.78  )
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

Add 'mode' property to distinguish between 'controller' and 'target' modes.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    Change from v4 to v5
    - add Krzysztof Kozlowski's review tag
    
    Change from v3 to v4
    -fix dtb check error
    
    Change from v2 to v3
        - using 'mode' distringuish master and target mode

 .../devicetree/bindings/i3c/silvaco,i3c-master.yaml   | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
index 133855f11b4f5..3af77d143f018 100644
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
+    description:
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
