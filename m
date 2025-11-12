Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E3FCD37BB
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Nov 2025 20:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vxVw9ae0E91vVuOpF8HoZUn1O/+CpqPufDHLvyBUWi0=; b=jNaJrDyRspX1AX
	fuzxUYjHeYyxDqfyuaivP6NmtQxap1z2n1JjZA9mCihftRpDNQMqLCjSIfs9eOcr0BHi1+tOg13Fj
	ydgiFwVYAZtsTL+NEnSROS/s86qA8IsX0A5K93IE+vTbHqSe9FMu1fkqFQar2RgXfSGrUQg/OCk0C
	Qf/9JeccsxdSPTDlM2XnSvHS7MMI2Hq+zai+cqm0alu7fz/pQ4udpNC17pU0CnLBzN0AnjsDY4hU8
	dgCm/4NPmoFlHubNewoxsleLtUziaVyvJAoBdxzzWGpBPWHzZfVmxeT7elv0GDu2kTCCdhvUV+PsJ
	n9pjQ0m059mqf+BXayMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJHHU-00000009TNY-0W6W;
	Wed, 12 Nov 2025 20:17:28 +0000
Received: from mail-northeuropeazon11012034.outbound.protection.outlook.com ([52.101.66.34] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJHHR-00000009TMr-0joF
	for linux-i3c@lists.infradead.org;
	Wed, 12 Nov 2025 20:17:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgbJL9ndf4eqqLGe5pa3cQ8lXYcAE7om+qJ1pGXSKqMC8XKFeSGYheZrw/7PX7kV7C3QjvpBbwLYQg0iPtvr5sRU8Kif6ozn7OqgOXHhScqcnztEB4qDBZO5WsVmJbArYLXLhydAyfnGUy72WSPGe1+uEFKsOExGeSNEdxdHhorYohrcB+OYngPlMqxKd0Um2c4YaZpVT/bgRcaDC4aw4x3tBndtt4+vDgn3MluJhoZ9EMzBKpCi8jrkN1Ep2COsSEpriKfKRttNP4plQyD/vk3cn37tn/w/hLFfWBPlZRd6Lji/MS/UdsKot66awczVEEmdfOAQ3IUEQJX1b70ayw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEaDanZbDIKo0Esc7xY9wWBJfVa270/epgTYsxPEmnA=;
 b=rtv70nv3hijsPeRnrSQnY7YZ1enCbre8tQukvMANXXK+tYCi8gbVc8c1sjD1nTJYLVpjo/ae8sS97X4uuBXBIoXNAnWPk3N/1J/Sel8EM7UEV4BbftdCz3pOyUDqIRoWEjxCeD+kPcd5u0oDBGXDrSKXa076dXGQV2i/HkXQ+diUpbXyW3A1js2tcrZ0cEsFSPAh8sfIatGGn18ct6jLAKo+7B6AATZFTf1SGBg8NQVGtLeEYK0VWjG0x632/S3plyDRsi1EWT3+fn1ZKSlYCDcUgH+Tu++tIvUe75zXdsr9O51K1WqjuMh1VzuFBcr9NaO79Zr7HSNOTafnSfJ42g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEaDanZbDIKo0Esc7xY9wWBJfVa270/epgTYsxPEmnA=;
 b=M4oHzRcWwVEoqGvall3/++IQPRdB4VPHQvBcOPIflRoHyNkdXmirqs8ryYu4aT56Pa74CoUh2qMfWY5zmW4PgT+1mQ5gcgprtdNHMfI2owscVUDbDpGZbT0lq27ke8eAgeIc0Q4Yl7HoS59XtsY0U6UsZB+W5+GYQFwzFM53vaDPqvnCAMlXl76L/tY+aKUGizvqWPSC2EiKIMkVL9sqv7pz2g49u21VMdzj9hYcxpxB/7ShuEbULz7YE1ziCgZnFKhrudQ64258+ADa4q/IQzL5VFA715pS5K3zSm/WaGQqPYlFtzJjLZr0w0xl0l7kyBdK6yUdblwWM9BqsBMcEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DBBPR04MB7945.eurprd04.prod.outlook.com (2603:10a6:10:1f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Wed, 12 Nov
 2025 20:17:20 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 20:17:20 +0000
Date: Wed, 12 Nov 2025 15:17:14 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 08/13] i3c: mipi-i3c-hci-pci: Allocate a structure for
 mipi_i3c_hci_pci device information
Message-ID: <aRTrSjchN8vbkhf8@lizhi-Precision-Tower-5810>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
 <20251112100339.51726-9-adrian.hunter@intel.com>
 <aRS4yBCoVJfecs4t@lizhi-Precision-Tower-5810>
 <2c4c5eee-9228-4790-9954-07e9e9ecfcde@intel.com>
Content-Disposition: inline
In-Reply-To: <2c4c5eee-9228-4790-9954-07e9e9ecfcde@intel.com>
X-ClientProxiedBy: PH0P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::14) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DBBPR04MB7945:EE_
X-MS-Office365-Filtering-Correlation-Id: 6915d234-675c-4916-a677-08de22287bb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|1800799024|366016|13003099007|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RbqvgxCIUeclg96KBPgVh7HvKKVr1hnf417PLTcdeEiddrEOghQK4EPu0WEW?=
 =?us-ascii?Q?4yuXVvonJMfne4DtT7LuMnIlQygzOmCNn/tSotCu77511blOJ76lEUggK4Lr?=
 =?us-ascii?Q?LYdXyiBiuIRjWDA6zqcIj0xXlXtpBsP78s5ur5wJX+CTXz5DvdFcyBxxxXEu?=
 =?us-ascii?Q?Pd0X5qWaaIPe+C2uioUCpGNbeuDqR9LwPbAUJZUZ3bosqsKnduZhnNu3VrhP?=
 =?us-ascii?Q?djdPLUb5nzVCyRu83pJdojv+E0A8GQrxZKkvI8hGUaggIX28tVPQnG9ObSYM?=
 =?us-ascii?Q?z9ZhMdfwG7mUQhIwWOfbFfk3E0hJSGP8ekUjZQy5enERcgntEQJlecjtBJEd?=
 =?us-ascii?Q?WuCLuRdKyyMCOHDAaLLzU+pXr2NHlgraQ6LR2Rt9R6nVAYnYaRYfnIcRLHqK?=
 =?us-ascii?Q?h7kOmMNq35ObzDFlIgbJafVtDR4iOQn0syso2H4DhOqlI5QLGZMnxdUQpx3s?=
 =?us-ascii?Q?L4gBdWYfU/3gKlkPDTXU4vDDUY1539P2ztxax24RvGqpVPU993l62eucID1o?=
 =?us-ascii?Q?f7CQookDb5AvGRMnBe6ImU8njA8odcxtUJvBHoQGlPWZDJw7DtnVuYijIc6g?=
 =?us-ascii?Q?jtPep2Cc7zfVDp53zIpFEZrcd5nTtkJTYYfDMeG1A31jrOhZ+cb/c9GJW7+J?=
 =?us-ascii?Q?LjLP45oB9aPunytgR41JhMSEwC2nisazBl7Fxzss+Z1etwIKkNV9SJ+Txene?=
 =?us-ascii?Q?dn9sVQFJDUQseaDZoe5ERKz4qKt9pTJxwcvC+V3hWlBdluwmvtJTeSuRUj0V?=
 =?us-ascii?Q?2xl+972PK7xRzxw87eHt88yWcpwEBcEZhfH3F03uMEQIB2taWj3r+2QjZywT?=
 =?us-ascii?Q?1KR0PrcaFMHqjzrf5uTU/234uQSlQGSKOg5HcdY0HWdn+icdatOnQ29QASFi?=
 =?us-ascii?Q?9fVL1sgVL3AlKOwXeAcqK69l0+WT1X2FnkreZD9o274hCIBJM4lhE3WD309W?=
 =?us-ascii?Q?+5N80OF0M7byUiSs6z+a1dULdv+CnqApxwvjA/0g8rlSq9z6NLp/C7tlvmjO?=
 =?us-ascii?Q?JtYFiTSOlliDT1NlXXYILz+RE6o8cGLuIX49Xgo7+9YYkZSX0+Au0DwxRM3s?=
 =?us-ascii?Q?ctT+YsID5d7NdETXmItDSr38+D2+WR4TQICD/XkoDOyON6Nkegxm7y0Ez3Fj?=
 =?us-ascii?Q?udqXmZgbKab0duAJ7KA7GtVrv/DOOICR2y69pgggRRPUzmirmdasdb+N3Qx9?=
 =?us-ascii?Q?Fipc/eJ1/Z6XVhLKF8Qe4yenANGQkXBbENoMJLxn9f184xTZFqXK1MHb7EO5?=
 =?us-ascii?Q?zuinP/Lq0rldnSt1NL2k8IuF6t6JUM2Byck9cTVywaj3fgE7mAoPF2RAnJ4q?=
 =?us-ascii?Q?hmlGPPJ16OIbU2k9znAoqPB671MACB49Dr7LQcDzjHJxXzbIs5846zdl4O5W?=
 =?us-ascii?Q?HG0cq6wxCdsAevCSundhStS4IBHaHFkPljm4CR4eCKdWS4lLbjRo+rajpTgc?=
 =?us-ascii?Q?7mTjcPTOoYmRpb6VfQvJnHOurYwh+I4gBL2fnVKnNc0XfX3hQwNRAHaCNFbO?=
 =?us-ascii?Q?RBbxopAXG5R0u5ENOsCPR5OmW5AUCYQbIMsg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(1800799024)(366016)(13003099007)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lLTmA8E+1WxRE/yz37JQHFWlGVEvRe5cgo1RkaIhdOg27yS5OnyoylPx4MPW?=
 =?us-ascii?Q?B5AjD+Ux3ljlp/fBmTr6YOQAvCegRHKm30SDqZmcXQAuSUlisMwZeCOY8dHj?=
 =?us-ascii?Q?z6S5lY9ZDN6SnvvJYh03ceroM9QbDleN6FkqJL4HfAKxZbi6OU5EWpbWboOv?=
 =?us-ascii?Q?OsVRNBEB8u6G784M+HcgV8NhKgdzLwg+hOKlEaf2sEdwvUeZxIKwwfFcLm6a?=
 =?us-ascii?Q?tcVjFhWG9h5D5IP2GdGo8+1EEbKPiatFz3jBQKNu26UHRSH8LimfCdLaBACW?=
 =?us-ascii?Q?9+jYvVRP7MBrpi2oPJ4JB4q9GD8N44LgV1XZjewR4cWG03m1uI+FRDCPrxah?=
 =?us-ascii?Q?v874HRqiHxSf8EN5VEdtLRuqQV4AjoVlclXWBNDTw2ec4J/QbnCqaQk4uhUb?=
 =?us-ascii?Q?YxheoKQuYkIGLm/PT4MWBvSpxXr4nAZ2EBf4mE0VaOuXsnEBXUDXqHOOkA/Y?=
 =?us-ascii?Q?M9h2LlHoj+CpizXjKATgwAtK8b5CCQejrn9CBtyfMNEtf3Lf6IMXE50KVjmm?=
 =?us-ascii?Q?eTAjpz9ghC8mwgoOgzrRY1hkm45JieakP2XimyEnxhXhy3SE8txG4Oheap/o?=
 =?us-ascii?Q?KguCzaLhuM6s3ilqvkKstl6YQJWA5PhH1CVKdnO9xxef/s7VNt3KxBZHSURa?=
 =?us-ascii?Q?oeY7F8dfJg5/R80PLR/KwHEMjTGxdcErMbVyfNNytJW8NASLYK3tKHavZu5W?=
 =?us-ascii?Q?W7fMosAIVGgaujLULR9qgbJK1LaT9MW+/J/yVhQNWOQp2b0ddzZ3Mk3W1IO1?=
 =?us-ascii?Q?JORQ8vwxk+B+cfniQUlGID3MLTupvalk1PECbct+Of3UNYocXE4iuHhOME4D?=
 =?us-ascii?Q?hghkOLJg9kfNKjrC4dW1e6D5/UsJu4Pbls0paYSb4wtsQElf12sdl6NBX/FW?=
 =?us-ascii?Q?r/nXxufOX04wrZjgB5mUar3Lyjy1RfcrFQwMllXtprboBm7PxgXrkR0h1wZz?=
 =?us-ascii?Q?NZinGaqzdbeLgscJ96zqRziwhczo9kibn928oeDRl+WlxhQxpdAA5d+LRlus?=
 =?us-ascii?Q?/E+ujUF1tYonc9Ay3hY5ztsGmJ4Yu9ZsxGii2zLFP9+eXp3RybvFiHMS8Nvd?=
 =?us-ascii?Q?IqNO6AY/2IzVOH7r060Wfy/CMqx5GMAz5QdX299gAIjTfmQy/rgQ74GcpxsA?=
 =?us-ascii?Q?ntNPvfwbbJeZjEE3VjGkMYkQceiw0qOX5wNjFX+HqUzoHNqnrbkFuqnI/OyH?=
 =?us-ascii?Q?uB+C+HN/8Su8+H3XJuz8hYs+64XWhqwC3r4GoEh7WICSB5yGkQeWyOBO2CNQ?=
 =?us-ascii?Q?xQlJYW+Re6yRI8UErt/5/heMnfcPLKm2tBpgrAA2xXfqv641Sdp4IEd5/TCI?=
 =?us-ascii?Q?HmrWA6qDpF3sEtasfPODuS1mclpGaWMX29LDEGA9bsvL+mTiyWoyynqDI30e?=
 =?us-ascii?Q?THYe1NY7tCCn6p0WmsccdDXN4LrBAze02vpQl5wx8d90ejQRCqUbSpNu2093?=
 =?us-ascii?Q?lQsFMNk2Wau8y/QiwPi43LD18Ihd30jYgQemNbXwDCbRZknlkDfNtZ+Boxbf?=
 =?us-ascii?Q?y8jXVHbFxOjLKa167BTgxHHROPA4HYzesfzWjNvoWQJQJF4hz6lZy5Xp0ic+?=
 =?us-ascii?Q?QwkgV09O3Bc9PaQCrvYFfLwNpHcWLXRgizhfA2J0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6915d234-675c-4916-a677-08de22287bb8
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 20:17:20.4584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 65j/UG5XpoD1hJIaHRiNEaIvj+e99S4JKZCquYlvLc78uvWFvkzFjkojzV+epdkUF/KzaWW0f8T9JB7R/C7mlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7945
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_121725_243597_8063AFE6 
X-CRM114-Status: GOOD (  27.39  )
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

On Wed, Nov 12, 2025 at 09:25:14PM +0200, Adrian Hunter wrote:
> On 12/11/2025 18:41, Frank Li wrote:
> > On Wed, Nov 12, 2025 at 12:03:34PM +0200, Adrian Hunter wrote:
> >> Allocate a structure for mipi_i3c_hci_pci device information, in
> >> preparation for additional changes that need to store mipi_i3c_hci_pci
> >> device-specific information.
> >>
> >> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> >> ---
> >>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 29 ++++++++++++-------
> >>  1 file changed, 19 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >> index b3b6b6f43af2..9fa89af7479f 100644
> >> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >> @@ -14,6 +14,10 @@
> >>  #include <linux/pci.h>
> >>  #include <linux/platform_device.h>
> >>
> >> +struct mipi_i3c_hci_pci {
> >> +	struct platform_device *pdev;
> >> +};
> >> +
> >
> > Is it simpler by using platform_device_register_data(), pass down platform
> > related information by void *data?
>
> No, this is just a normal allocated structure for the PCI driver
> (mipi_i3c_hci_pci) to put information related to the PCI device.
> It is later used to store the current Latency Tolerance Reporting (LTR)
> register values.

Is it static value, or does it change after boot in other words?

>
> So it is not the same thing as platform_data.

Base on your code to create platform data is duplicate what's did by
platform_device_register_data().

The pci device create platform devices,  platform driver should not use
pci's information directly. platform driver should be reused if it probe
from acpi or dt-tree.

I think it'd better pass down platform data information, which can include
callback to fetch needed information for difference's parent devices.

Frank

>
> >
> > Frank
> >>  struct mipi_i3c_hci_pci_info {
> >>  	int (*init)(struct pci_dev *pci);
> >>  };
> >> @@ -71,10 +75,14 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
> >>  				  const struct pci_device_id *id)
> >>  {
> >>  	const struct mipi_i3c_hci_pci_info *info;
> >> -	struct platform_device *pdev;
> >> +	struct mipi_i3c_hci_pci *hci;
> >>  	struct resource res[2];
> >>  	int dev_id, ret;
> >>
> >> +	hci = devm_kzalloc(&pci->dev, sizeof(*hci), GFP_KERNEL);
> >> +	if (!hci)
> >> +		return -ENOMEM;
> >> +
> >>  	ret = pcim_enable_device(pci);
> >>  	if (ret)
> >>  		return ret;
> >> @@ -95,14 +103,14 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
> >>  	if (dev_id < 0)
> >>  		return dev_id;
> >>
> >> -	pdev = platform_device_alloc("mipi-i3c-hci", dev_id);
> >> -	if (!pdev)
> >> +	hci->pdev = platform_device_alloc("mipi-i3c-hci", dev_id);
> >> +	if (!hci->pdev)
> >>  		return -ENOMEM;
> >>
> >> -	pdev->dev.parent = &pci->dev;
> >> -	device_set_node(&pdev->dev, dev_fwnode(&pci->dev));
> >> +	hci->pdev->dev.parent = &pci->dev;
> >> +	device_set_node(&hci->pdev->dev, dev_fwnode(&pci->dev));
> >>
> >> -	ret = platform_device_add_resources(pdev, res, ARRAY_SIZE(res));
> >> +	ret = platform_device_add_resources(hci->pdev, res, ARRAY_SIZE(res));
> >>  	if (ret)
> >>  		goto err;
> >>
> >> @@ -113,23 +121,24 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
> >>  			goto err;
> >>  	}
> >>
> >> -	ret = platform_device_add(pdev);
> >> +	ret = platform_device_add(hci->pdev);
> >>  	if (ret)
> >>  		goto err;
> >>
> >> -	pci_set_drvdata(pci, pdev);
> >> +	pci_set_drvdata(pci, hci);
> >>
> >>  	return 0;
> >>
> >>  err:
> >> -	platform_device_put(pdev);
> >> +	platform_device_put(hci->pdev);
> >>  	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
> >>  	return ret;
> >>  }
> >>
> >>  static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
> >>  {
> >> -	struct platform_device *pdev = pci_get_drvdata(pci);
> >> +	struct mipi_i3c_hci_pci *hci = pci_get_drvdata(pci);
> >> +	struct platform_device *pdev = hci->pdev;
> >>  	int dev_id = pdev->id;
> >>
> >>  	platform_device_unregister(pdev);
> >> --
> >> 2.51.0
> >>
> >>
> >> --
> >> linux-i3c mailing list
> >> linux-i3c@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-i3c
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
