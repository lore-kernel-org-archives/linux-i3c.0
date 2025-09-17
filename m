Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253C6CAC59A
	for <linux-i3c@archiver.kernel.org>; Wed, 17 Sep 2025 17:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/bM0SaQN4G2MG2hTYKnE8BivrOVSTt8haAhcQnsjn2o=; b=cEymu4PshvyLJ6
	W5FXB882gAdW9EzXYqpLfOpx4zOvQ52KoK4Y3l0w1MjnZA0zXHmSU46AwfQ5RuJwsYheSkL6LJflo
	qGKIWz5d3Tw3eOU9NfPcMqvjYQbW10FkufXWqnO1b0398AxrI4NupVOcwMtyv5zKAxih70ebEtBcM
	0btUyHbBCsht1Xq9owjI/i80mWt0NvPdpmA8c8ji//r/ldiYQomgpCqx7H3INO/uUWPCYng+98U7Q
	LRBgXzV5t4A7o1pBFjRHmLa5llWhQoiHIZpu+dYHCExWAp01s7Toa8cb76NY9RAUe+vtGfSDbdLVK
	F0I5iUHWvJYOdm1jllow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvVp-0000000DNc1-3pmc;
	Wed, 17 Sep 2025 17:00:09 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvVn-0000000DNaw-0xVN
	for linux-i3c@lists.infradead.org;
	Wed, 17 Sep 2025 17:00:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M1xqgjCH7fCuC37F1coMRrcZc+hQeWfcGkbjShJjnS1/wTBVJubeQzBVidOQUztO7WtNiJSmii2dwW+Eszd+FQ0eyRHVCaAsImlQWIVZYbNhHOiXTGpQAViTZ1ZRvxwz6biEfiaReDIUAsUEfuQqy0EfZaJ2tslpfqo2rPYr0a3Xq0EI+iaq6jCIQ4/MbtOp74fR2YMv/nCEJPuNxnqlrbMKLY1lr1w65OCAXWRBlIDADGf4Kqneut1Cbc0SZEKqSj6HbFSRf6Wd+oEmNykUFcRQiCns/SL+yecPEm2DqItNSVyZzjFR3EHfLHgFqrJ1oENYKCOqH2BgN7a9ypzqTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgGZg2ZlQh/ANmOWVH4rHaO/BJhDrPM8coUbxcg/xNM=;
 b=SHeBDmQQiWUFj3kBGbxzplRLoGvNQZy5cDqMwyvxHGfaeEMX8ujRmSvbwFVVdVx0LHaGTj/zjlxy8QpObQ1DLF4Dw2XhfL/qlh/45KqfaEWYQOf58NKigE5tL633PHY2xqk/3vIXyhCldjW8QafbIK92QaTRquHKQUL2RM01eVus2daHRAQgj2LWzIeLovKjYeTE86Oif7He5/iRyDR3Is8ZA/U9s9fIJc1YtC7m+T0TSybl0N+XfWO44pe362v6HlQpZfIYpmioId9W21yidIn5tNooQ0XjqX7Dwva3blX8b+Fb1u+Ac10DpTKYKe0hMgP4SRCH0b1RWZw78L95lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgGZg2ZlQh/ANmOWVH4rHaO/BJhDrPM8coUbxcg/xNM=;
 b=UOZycJ0btHjxlwxB+sM86yEKvmyWMvhhHpxT5g1OcSChfY4tiQIG5QlBbIPt6GeFsLw1sR6ZVrItqYKQvJ1nBF2CRijldbjE1yDM4JxGRTSSFk/cnGcCpMVQqKg5LJHocWlrzm+O8Y+i1gP9oRjMyGzZc3ALN1n16dEbcWbHNcioqHt9CZAKGn/8e+g79aneRFqhsztjawMjYuPUB4XKOvsel7RxllncNlJ7gquYk8WCyo6BXupTbUXU08ICS6gWcjFqUAttLle5MDZ/lT4TulhLIyviAKob91Nr09pKOU6mUmCaR6YUnczwlBAZ7JZCMYQgmpfe+KzHpbLxjcd95A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AM7PR04MB7141.eurprd04.prod.outlook.com (2603:10a6:20b:11d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 17:00:00 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 17:00:00 +0000
Date: Wed, 17 Sep 2025 12:59:54 -0400
From: Frank Li <Frank.li@nxp.com>
To: Steven Niu <steven.niu.uj@renesas.com>
Cc: alexandre.belloni@bootlin.com, zbigniew.lukwinski@linux.intel.com,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: Add i3c-hub support.
Message-ID: <aMrpCk6RZ2oqfrUI@lizhi-Precision-Tower-5810>
References: <20240217131412.4145506-1-steven.niu.uj@renesas.com>
 <20250917142055.2806576-1-steven.niu.uj@renesas.com>
Content-Disposition: inline
In-Reply-To: <20250917142055.2806576-1-steven.niu.uj@renesas.com>
X-ClientProxiedBy: PH8PR21CA0023.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::20) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AM7PR04MB7141:EE_
X-MS-Office365-Filtering-Correlation-Id: e3619846-6b29-4f17-ae77-08ddf60ba321
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|52116014|1800799024|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5V3xO40WUH+W0uR7u1BO6FJU9drYXgBdj6UnTAJUHAzAAstdZCZ8bamXQ+Bh?=
 =?us-ascii?Q?iaD7bVgKO0g8Ok+Qhzq5zNTtbmLYw6sfKRcB3E2maxQg7XMXC/hluTATNeCt?=
 =?us-ascii?Q?5vuULbCSYd6J8iVbhc0/uGjIizrgZbe+qbBifS1Gr4kd4R5NgppYXg2Yx126?=
 =?us-ascii?Q?QWWuZlc5uwD3sYsvYnahFYb/33on+uJlMBzsLdxQqiVqj6oD82PPmWqlS209?=
 =?us-ascii?Q?Jmf5tAjWcR+bagTY4j8Xt4WAeu7mrMpinxOi3uHsKafzflvvTBgcP9Aip02P?=
 =?us-ascii?Q?DWR+RXWmZrSL46NMace3hjmsNAKV/m4uRvFAmD65gt8DDPZQFzrbiGzSeBNK?=
 =?us-ascii?Q?HSIs/fZ7ELAVjMFsIsYv7Uoog/Mjn+9ViJar+maHL8LtwRP+66LwLn3vqai2?=
 =?us-ascii?Q?gZiFVE3iuLr+sYPiE+UAkIvvi9I3ukmTe0GZD5fgdbfVL5KdaaYG+W7P2yLH?=
 =?us-ascii?Q?q3v9znWdxBB4RMec/wAp/RPn+rapwSi89ZD/CR2tp/rh4jjh2n9qaLsQfM+F?=
 =?us-ascii?Q?607Eq2EC+2qU0BC5/R1mcY6xnJ9eoxlL3sIjkvLwj5n4mePkgrtSwr9XkViu?=
 =?us-ascii?Q?+G6K40bNvqwSQ5Myt9YamJPawKSneH/Vr/v6zekjRfholtudNIEXgXJ70aXq?=
 =?us-ascii?Q?JNrH1slMhyfVtc+o/rapZoHWoMSMpIQFynNqr3orYkShECNGWz9HnVTAMVmI?=
 =?us-ascii?Q?ZRuOHrVHR+fuoUDuESmakondF9k4/lP6wI5EshPc9vq3wajIu0TdN7oEZ0xF?=
 =?us-ascii?Q?G/XtwCCffYZyYst80G70XQfWcAaPsYjAJAJ61PR002b1jv+fd6CAOcWb+bS5?=
 =?us-ascii?Q?qJGaVSD819qzEPb/P90U/m82k8YgOGVgLPvN4temcE6FgPkpmBcWIU79dXkk?=
 =?us-ascii?Q?wCZmNn9iizVGKGRzYDSQ7JQaIykyoiufYD8nC9kXLttohyOgpJMs+e2ecSZZ?=
 =?us-ascii?Q?7Wp2YuHAny54SplELfeRa0CQWz3I7CCD7M4fxGvxD332MEzX/NJE8OrimA4U?=
 =?us-ascii?Q?TKwF94yJQifoErmoR9/SlK1tXgF5qrIAjN5e0DDbJ5LRj/ICwdFGWDNVxnyF?=
 =?us-ascii?Q?AEe/ydLhH9MBBbS7X7rpVdba1kMeuWZkaPPNZ5eAzRZgRkzLa1kGIL/wRyW0?=
 =?us-ascii?Q?dM9OfRmYox6aXvzeNdoRioQeZjaxt4BTv5TgHnqYQWklX/Aun73xSYIVBPZ1?=
 =?us-ascii?Q?TeU65SoXKDtbEEXiZiRXOHquand/jG0R36rNyyWrHiH9KmJomulpI65iVfaL?=
 =?us-ascii?Q?Jympw3q+XSRf2WvR9sHZXpBlIAEypkB9yjBIj/IZr67ngwGmTcdTiYRYZ71G?=
 =?us-ascii?Q?JNo+y1RaPF5ip+Wi5a2ie4MoDvywIGp7UjNhGR/7STLuLk+jfsm8/15CAAW8?=
 =?us-ascii?Q?vq1JX8NBQtkgnvH9VWWWAuKMdmOz2VB7M5oGJzNnIdfLsc6HjB3OFcDSoBMY?=
 =?us-ascii?Q?k+I4a+FC6dg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(1800799024)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7096F96PSSaHBfvi3vuOhOQsHHkDWr/kArtJJNc11XQ2FBYMVzTEbG0RG77J?=
 =?us-ascii?Q?gT7kEhEpCi16fPAtzEmOhdwTTVlFonXljAbqirrlicF0CjV5AXB/oc6Tspcv?=
 =?us-ascii?Q?iherbEUx5XwLSMjfIiu3nI3ycW+dNPmiAMU5yjGyF78y61KgaVpePIKGz6Ux?=
 =?us-ascii?Q?Y0wCTqMaX3Ch/Usa0PtA/729IsqplkJg3T2GKesNxyMen0eC2g/QaP+zDpGq?=
 =?us-ascii?Q?mPiFq/QardUkwV9aL84pAnNf0QfkjYDzoxFemZfLyB1bZy8i0kjmYN6nwJwr?=
 =?us-ascii?Q?BiBuskzRL/MSBbppUlYi0BbqcpqTcJQgCow38EQk5vPO9aRWEOT66YWwDJ1q?=
 =?us-ascii?Q?Qj+GeiYE2SaL9id5RLEVtT37HogZVlkXGE893q9Rr9nJutQy4RVGZyg5PnoO?=
 =?us-ascii?Q?+pkzGLSo5g1IRZcRDHFjBF5Q+v1v9AEu6G/JsWpmcRNcVwW84i6qyDMDqclK?=
 =?us-ascii?Q?K6ZoWBQDm0Rs5ec9ETEnfSsthjarT4Emok44h/c0x/l3w+kiaO2iE0I7Rc/7?=
 =?us-ascii?Q?VFYU0I6DHuVVzcm5BPyyUebVothaoeZXVaNJCO9NF4gIlQOLO/xYmxP54OyS?=
 =?us-ascii?Q?WRvxlYGjwMptQfLaYF4jwpruIMKbdFXpy3m3SnoNz77GTpFwx9jJ28amYYBU?=
 =?us-ascii?Q?cJWTUJ7Q0i+1UUo9GTa1d1b5m+XFma/T7deRL6oiaV16svK16NiEaMtedD0A?=
 =?us-ascii?Q?V1LPOfAHQ/F0/NehKt5eeeS4QEdtsg0oy0kOOC9rj17tZCao4zN3Jdu5Ov6s?=
 =?us-ascii?Q?Gqoek1+K7Mdt43qaTYtpuZWpfcUwfEpqKg4iKUHQYg7h7jY1CiS6kA9o7knH?=
 =?us-ascii?Q?i/bdgEq2/W0W1B6dj4mm2Yy/MN/YLoL74JYhD3B6IZ167nuddu/QTYlh1MR4?=
 =?us-ascii?Q?Q/oBHNiR/JEBSlfz/EN8eEMfidlx2X1oDFt3JaWlp/pAZQXeVsVR8BrDzNIs?=
 =?us-ascii?Q?C87wPSO5vhQLK9I33v/D68oIU8bQIUVtY/niEiaFGhpt3G5uoTFQLJYnd7j/?=
 =?us-ascii?Q?+wNijzD1Dh80ya1BaMzTWMPN/SFaiTA7B4CpWQV51iNUqxdgKeMbuvfTFVAf?=
 =?us-ascii?Q?w/T/rayBHPH6YYJL3961TNMegwd7p8fAa5uXIOJpFEywO4AIZR/Sagg0aeHR?=
 =?us-ascii?Q?ZYo/Ap/O2fl7KVHI56e2OvhV9Q250gqIutui+lbEmxCnWte4bMECVE03gz4S?=
 =?us-ascii?Q?jCuQp3m8CbOVvEM6To+dptjJjzaP5Z6tGwVoItrj3ZSTjYYO0ZgfrIKIGxMy?=
 =?us-ascii?Q?FiVFd7Dx211EKJcKVL/BcpaAe+SRrQqqgQ/SW8K3VH2q80pnyHEeXf7EJLHL?=
 =?us-ascii?Q?LowzeBrpVoEKsfjUjQl2ZTP3XBhcSINYog/ZXSz/PRkIg4ASoIC1OarvlR51?=
 =?us-ascii?Q?zYjZeQeh1u2AW6guBpMNikVv+nT+HDHJMMbd4o9xiKWJUlj5wkMZMR7w9ga5?=
 =?us-ascii?Q?Mp9Ho1ON7pHua9504nMdeUm6q3lp4b874MmytOSz6jVJcjXthxPVH5JgIMj8?=
 =?us-ascii?Q?IxQ3QyguKKZ9yVX+L9BucqVA4N8hQ8y7L/vfUGdEsQUGLsCvtY/HlxCHW3ye?=
 =?us-ascii?Q?/csuKlJHUFGZPcmVMWrNSCvUJ6MWzy0yv/KZGoWi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3619846-6b29-4f17-ae77-08ddf60ba321
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 16:59:59.9877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMlgve93MXzEyFZ+N95HlZXEu5Jw8Vq1v+8K1+qnOI8+D67YTXjBrFV8bsMFPZZrroj0dCJxEYWA5Sc+hN/fmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_100007_448915_DA714D07 
X-CRM114-Status: GOOD (  25.82  )
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

On Wed, Sep 17, 2025 at 10:20:54PM +0800, Steven Niu wrote:
> Add device tree binding documentation for the i3c hub devices which follows
> the Intel I3C hub specification.
>
> Signed-off-by: Steven Niu <steven.niu.uj@renesas.com>

I am not sure why combined to previous's thread
dt-bindings: i3c-hub: Add Renesas RG3MxxB12A1 I3C HUB
https://lore.kernel.org/linux-i3c/20240217131412.4145506-1-steven.niu.uj@renesas.com/T/#t

>
> ---
> Changes for V2:
> - Group the device device characteristics into groups:
>   - control-port
>   - target-group-x
>   - target-port-x
> ---
> ---
>  .../devicetree/bindings/i3c/i3c-hub.yaml      | 261 ++++++++++++++++++
>  1 file changed, 261 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/i3c-hub.yaml
>
> diff --git a/Documentation/devicetree/bindings/i3c/i3c-hub.yaml b/Documentation/devicetree/bindings/i3c/i3c-hub.yaml
> new file mode 100644
> index 000000000000..c5af39b031ef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/i3c-hub.yaml
> @@ -0,0 +1,261 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/i3c-hub.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: I3C HUB
> +
> +maintainers:
> +  - Zbigniew Lukwinski <zbigniew.lukwinski@linux.intel.com>
> +  - Steven Niu <steven.niu.uj@renesas.com>
> +
> +description: |
> +  The I3C Hub is a family of I2C/I3C 2-to-N Hub devices. An I3C Hub device
> +  provides connectivity to up to two control ports, and up to eight target
> +  ports. By cascading and duplicating the i3c hub, the user can build a hub
> +  network to provide connectivity to a number of devices, with extended reach
> +  distance, and running with different level of I2C, I3C, and SMBus protocols.
> +
> +  I3C Hub Spec:
> +  https://www.intel.com/content/www/us/en/content-details/823670/i3c-hub-device-specification.html
> +
> +allOf:
> +  - $ref: i3c.yaml#
> +
> +properties:
> +  $nodename:
> +    pattern: "^hub@0,0$"
> +
> +  compatible:
> +    enum:
> +      - renesas,rg3mxx
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  id-csel:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The input settings of CSEL pin. This can be used to idendify the i3c hub
> +      in a hub network with mulitple i3c hub hardware instance.
> +    enum: [0, 1, 3]
> +
> +  id-cp1:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The input settings of control port 1 SCL & SDA pin. This can be used to
> +      idendify the i3c hub in a hub network with mulitple i3c hub hardware
> +      instance.
> +    enum: [0, 1, 2, 3]
> +
> +  id-tpx:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The input settings of target port[n] SCL & SDA pin. This can be used to
> +      idendify the i3c hub in a hub network with mulitple i3c hub hardware
> +      instance.
> +    enum: [0, 1, 2, 3]

I am not clean how id-* use. Can you explain more about it?

> +
> +  control-port:
> +    description:
> +      Control port configuration.
> +    $ref: '#/$defs/control-port'
> +
> +  target-group-0:
> +    description:
> +      Target group 0 configuration.
> +    $ref: '#/$defs/target-group'
> +
> +  target-group-1:
> +    description:
> +      Target group 1 configuration.
> +    $ref: '#/$defs/target-group'
> +
> +patternProperties:
> +  "target-port@[0-7]$":
> +    type: object
> +
> +    description:
> +      Child nodes used to configure target port.
> +
> +    properties:
> +      compatible:
> +        oneOf:
> +          - items:
> +              - enum:
> +                  - i3c-hub-i3c
> +                  - i3c-hub-smbus
> +                  - i3c-hub-auto

just
     compatible:
       enum:
         - i3c-hub-i3c
         ...

> +
> +      reg:
> +        description:
> +          Target port identifier.
> +        enum: [0, 7]

This means only 0 and 7, not 0..7

> +
> +      io-internal-pullups-disable:
> +        description:
> +          Select whether to disable the internl pullups on I3C signals.
> +        type:
> +          boolean
> +
> +      idle-disconnect:
> +        description: The target port will be disconnected automatically when
> +          there is no bus activity.
> +        type: boolean
> +
> +      clock-frequency:
> +        description:
> +          Select the clock frequency of SMBus Agent Tx function.
> +        enum: [100000, 200000, 400000, 1000000]
> +
> +      device-scan-delay-ms:
> +        description:
> +          The delay time in milliseconds between target port being enabled and
> +          the device scan prodeucre.
> +          This attribute is only applicable when the target port is configured
> +          as i3c mode.
> +
> +    additionalProperties: false
> +
> +required:
> +  - dcr

where define dcr?

> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +$defs:
> +  control-port:
> +    type: object
> +    description:
> +      Child nodes used to configure control port.
> +
> +    properties:
> +      port-name:
> +        description:
> +          Name of the control port
> +        enum:
> +          - CP0
> +          - CP1
> +
> +      io-microvolt:
> +        description:
> +          Select the i3c signal voltage level for the control port
> +        enum: [1000000, 1100000, 1200000, 1800000]
> +
> +      io-strength-ohms:
> +        description:
> +          Select the io drive strength for control port
> +        enum: [20, 30, 40, 50]
> +
> +      vio-source:
> +        description:
> +          Select the source of VIO supply.
> +        enum:
> +          - external
> +          - internal

prevous https://lore.kernel.org/linux-i3c/20240217131412.4145506-1-steven.niu.uj@renesas.com/T/#m037b908a91e7516d96637998f7d719821f0db1d9
use regulator, why change design?

> +
> +    required:
> +      - port-name
> +
> +  target-group:
> +    type: object
> +
> +    properties:
> +      io-microvolt:
> +        description:
> +          Select the i3c signal voltage level for the control port
> +        enum: [1000000, 1100000, 1200000, 1800000]
> +
> +      io-strength-ohms:
> +        description:
> +          Select the io drive strength for control port
> +        enum: [20, 30, 40, 50]
> +
> +      io-internal-pullups-ohms:
> +        description:
> +          Select the internal pullup resister value if the internal pullups are
> +          enabled for the target port.
> +        enum: [250, 500, 1000, 2000]
> +
> +      vio-source:
> +        description:
> +          Select the source of VIO supply.
> +        enum:
> +          - external
> +          - internal
> +
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    i3c@0 {
> +      reg = <0x0d040000 0x1000>;

needn't reg
       i3c {

> +      #address-cells = <3>;
> +      #size-cells = <0>;
> +
> +      hub@0,4cc00000000 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        reg = <0x0 0x4cc 0x0>;
> +
> +        control-port {
> +          port-name = "CP0";
> +          io-microvolt = <1000000>;
> +          io-strength-ohms = <20>;
> +          vio-source = "external";
> +        };
> +
> +        target-group-0 {
> +          io-microvolt = <1000000>;
> +          io-strength-ohms = <20>;
> +          io-internal-pullups-ohms = <500>;
> +          vio-source = "internal";
> +        };
> +
> +        target-group-1 {
> +          io-microvolt = <1800000>;
> +          io-strength-ohms = <20>;
> +          io-internal-pullups-ohms = <1000>;
> +          vio-source = "internal";
> +        };
> +
> +        target-port@0 {
> +          compatible = "i3c-hub-i3c";
> +          reg = <0>;
> +
> +          device-scan-delay-ms = <2>;
> +        };
> +
> +        target-port@1 {

does target-port@n belong to any target-group-0? look like it should be
under one of target-group-0/1

Frank
> +          compatible = "i3c-hub-i3c";
> +          reg = <1>;
> +          io-internal-pullups-disable;
> +          device-scan-delay-ms = <2>;
> +          idle-disconnect;
> +        };
> +
> +        target-port@2 {
> +          compatible = "i3c-hub-smbus";
> +          reg = <2>;
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +          clock-frequency = <100000>;
> +        };
> +
> +        target-port@3 {
> +          compatible = "i3c-hub-smbus";
> +          reg = <3>;
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +          clock-frequency = <400000>;
> +        };
> +      };
> +    };
> +...
> --
> 2.25.1
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
