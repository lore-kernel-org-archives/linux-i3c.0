Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CF2CD4F24
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2026 16:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p6XF8GuxPu79Q+vDKXb3NjjVA+YzzyMN7BTU64YohVA=; b=ZFq+RC+9VUa85T
	0AQn9kNu9JcvBXkPi8zDfWWcmCV4BL+Ya+cwBZGv6FVH9lXXRJ6qpmT9gbVd33AdGnsJa5yfAbfKD
	QzjxUc1Moqn/PRpE6EEzHWg+IGzQF7VPDiuj5y5a/rH20Vqc4ZJ0QI14xy4jLptELYGrM2X27O4bV
	SD/uKTE1UzkqvY4LxTpQnQ5wYyqZsRsckEm7yRxhzNBQXWZB58lUvtwxvX40UqC1fPLV4VJJAfJb2
	wtjjGY2eyCc496g0edhVyJBt44eSrPxVBXPX+w3njIO0Li4sUtbuQaKvCb0cah/dV6zPuyMJFNl4W
	u5S5RrHcsJ5oZY617I2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpnx-0000000HKiD-1xoP;
	Tue, 12 May 2026 16:17:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpnw-0000000HKhF-05HS
	for linux-i3c@bombadil.infradead.org;
	Tue, 12 May 2026 16:17:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WOoDBSUYfvHsHiqaknMyrLOH8by552gRWtOXav+4Zew=; b=pZShJAQ94fUSd21Jc8yofp+1ne
	2bNgZdGf8GwR/JZRGe3/38pD/vRrxHeH2nTe9kUaz/bLKPoQ/XJgvtj7queif1l5930g/W1HBmTj3
	pzHVY31zFs66Ym547x1P5/QTOgTyjA3cv6mvJ4FxtH+rBdooVKSSTR2wjID9s3GqEe8HpNFyP5H4c
	dIjAdKv2R/pbj3w0e0f16EJlIEoWCGl8mZhSc5HHi5ye4PxtuMySSA0wuPDZ8VjkVHzUy9KXgp66S
	guhgIGo4NJlusTCY65SHuT23nP1u7QBPfIpx9CzbYhNI0iiVVYehE0cR8zlt5asSyml/tMjlpMqqk
	egb6G6cw==;
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpfp-0000000FGpQ-0CDM
	for linux-i3c@lists.infradead.org;
	Tue, 12 May 2026 16:09:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lyiolozE16FEui1QbH/BkYhBlQAQVvikbRFRxFJoxhXZ97rht0NzCMqfy/d1cqenls5BUl6XfGquGkDE3BU/2KJ9lr0QtDXnworNjUvNRhMk6HXfr2i1Svraq//UzwcwZd5Olk/17c/cyQrFV/ik/6TNUOgBNxSatjCwfXIvwa0vda6Q4wwPtlBeyeB+K1KenYT7JkT/T3UayxW+NVp38yZr2HZdqS7ELkcIOJxpH/Nqe4OHoslLeRLXQAEaVyzijFm+qTtK+P9hvk2HWJJc62EA6+EbewURAmvG6rwQICJIUvD3jwCZFhHL02MsyQiEr2cDg3mp45i1ASEZ1dgiYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOoDBSUYfvHsHiqaknMyrLOH8by552gRWtOXav+4Zew=;
 b=jgSRnmE7My8d0nuLZzTFwuX17GtjMNjOeIty/37IgHcMTihh60JZdgVoeYrR3pa1l0YdaAghaHGisE7bfMD2LJS3Tw5WLXP4bilSkPxrIq9b7I3t6qEMEwTyXyjgzdK6lHtnrKr+SEARSIzgVc+weX0rdkmKoC1TmeP/KcJDNmo0VyC5Jcz9zqtEpprOzuBpK18+EV2X9jMbKtqwhaGcaeOdqEpC1kf7TXQjk0GGoGEwTzKSdrIaRWxiC5IqiPcT2MqgzrYxkjIip3hxazLOP3vbxkqW0KpAc0SJOTt/99aOeTfOeidbliN0Fp/dYw6gH5WsKhzJ7DmQqNsYfucg1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOoDBSUYfvHsHiqaknMyrLOH8by552gRWtOXav+4Zew=;
 b=lOEMoN8sxq7MF42zUXSN8trrduvRholle/yoy1h5fbYOwkn1FG8tTMmvuDDoKLQ7yOTmwR9OPDFcYNFCt2ZyeikLd8FuSzc3wCB099wKGR9Jv9sPlQb0VyBFo+hdISSvvBTc5dbqgVEJAw+umeWZZs80tZO778MIrw++z3UJ40Gy36dXBPxLp2ZzvEXaupHDjXCfilYlzVr3HYu6hLV59k4NnMp9EZi5FGGnxlDmyruAcTEaV/BPjvNApkkpNJnREE50VAOm5zR8D5PF4MP0UDo8I65ChN6LE0AUTI36fumlMW8g8gO9VVobwvzGlODdnADGDiBHsD/227d4wu9/cQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM0PR04MB6866.eurprd04.prod.outlook.com (2603:10a6:208:183::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 16:09:28 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 16:09:28 +0000
Date: Tue, 12 May 2026 12:09:23 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] i3c: master: Make hot-join workqueue freezable to
 block hot-join during suspend
Message-ID: <agNQs5Qf4x0Diaj9@lizhi-Precision-Tower-5810>
References: <20260512121732.406009-1-adrian.hunter@intel.com>
 <20260512121732.406009-2-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260512121732.406009-2-adrian.hunter@intel.com>
X-ClientProxiedBy: SA0PR11CA0001.namprd11.prod.outlook.com
 (2603:10b6:806:d3::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM0PR04MB6866:EE_
X-MS-Office365-Filtering-Correlation-Id: f2e20c50-bc38-41d7-fea3-08deb040d82e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|19092799006|376014|1800799024|366016|38350700014|22082099003|18002099003|56012099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info: UgOw3bfVzNuZGHwqXtYaMHjaGOdHIVjwk/H+/t+CLdQ4ENTzsBN11d3tG3Z6Lajp8452i0xM1ynAHEHkCoClCVL1xbT6keq9PxeiSmrnRQkTPp496p9OWmNQ/NyqDA9IRm8qFPjppO2FgXZNt3BoFGyuiq1+iEqqLj+BhW4xfaW/WkFf2jigOBgRp1LnL1eYEEC4uSTgPlMs/unP8KTSvGdBLd1RCtymC+uQe3obFHrH7DcrMdzbDPmqG0f7M5QWRzI740NjnV2w9Sxe81ZHWMaGzWw5+mT0JIT7MvLgdyVbYUpKqBvZoj3Wf4PkLzuHyb0Ud8vikmnOuNYUgxyYqDQN35Yr1xL2mV5sW5ontSw4XnvXML3Ptl3F51+emoPPoOvuW5+PZYpWFiAv616g5psODjC3J3M875WnkiC2+GYVjZpYbkUNwGANGuCcQByq29GEqhu48cS+ztGX+wTFV8zG8nUQHkqpRhfadfnzGklP796eqnXUorowzjv2YYj5K2zeChb2yYF+rOBKSlM4j468ceB1OwftXSQ5J18jun8E12qEIH3tOjonEioKxoPwaWpSCF+OZe+JDGa3OqkUqt7uNn0crAi+Y3yMKcEk2g6SpDPX5e3R1V2pA50gZw2JV16ccpA9+/yUe//cFqsWSEnqzY8DRWCoDGLze+//U4ohiwdYn/zTiapuxXC7bFd8CG/6NFisI5gLSyiS+gS2BqxWMrDAklaZCAwRPmxH9f5/fG4iXom5dSefJTPQU+Uy
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(1800799024)(366016)(38350700014)(22082099003)(18002099003)(56012099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ieW6ehHWnInYogc6iu17SSjvuJgdwSA85yeYpOR4soWPxbtFmVoC6yncL66q?=
 =?us-ascii?Q?ZLK+qPUCZy2luth/LjYTOl7JcvTnl50gwtSzGRHf1Rg5TsVwfJ0xPB7YwLD2?=
 =?us-ascii?Q?nxnRe9342bvauO9/8knvTQyvmTSSPGi4zHqafTQKHzY6DPXjRNp9g/4wyfXu?=
 =?us-ascii?Q?jrifonbfaJC3k6bCw8qcHzRaMc0ZrpZoA40a9FV68Nr+SlWbHzlpWCMkENKG?=
 =?us-ascii?Q?uIykbCxR5jbfHpaJ0H3ioyE+k+Rrxn8EKN5xHsXpOfRFd2ENJADDDP7EhACm?=
 =?us-ascii?Q?XZfUXaAiUObRthzC8XlIt9Ib+rKDz3rZAl3ly4+WmSHgZgIWammEN7JuguIh?=
 =?us-ascii?Q?9ok0kK3MUxB/pHHZ3YwcXr5pXioLWPEZ5QtIvRVPiH/4ZDXkTrtgVYRD7EI5?=
 =?us-ascii?Q?QauS9f8GPkWiyGxyNxae3mLU6gzjhrzsPAvwcUNZm7cMyjiR8eZKVcO6hNQP?=
 =?us-ascii?Q?MHOSPxYr+g5PmIVyj/kFlwesEW5STGDXTuQuGTbnZVXq64qZxEo4H9M7w0fZ?=
 =?us-ascii?Q?fL3VtuBCUVpj86rgsJX2I4G8CCjKoNnFFlT0dRsibgpJlCigMVAM7+KkPhl2?=
 =?us-ascii?Q?PS7u/Ikerkn/+nXi0WptmO/50AlWhK4POcRh9ycZXYdXptNfJzjkXfkTUW7/?=
 =?us-ascii?Q?wPYHyjR4qImunCYjhAbT1Vw4zObhGp8qjEhWyl+PDJFTA2uAgriMs9t0HS3A?=
 =?us-ascii?Q?Y7YYLlFP1HPaX3Kc572l41ojY4WUZCyz6xAL2V0nSd2FCLtimrVP1Dhj2Mtd?=
 =?us-ascii?Q?hQw54lNFU/U9bo6NIcaiWkZBFrW77lQ73Q/+ZODoMzcavmXpULq+d1u9iPic?=
 =?us-ascii?Q?kqhClbKL52y4GRY6F+yOYYRd0cH84zu+/jl88u5nZbn3N2Tg3Mo8hTGcvyCD?=
 =?us-ascii?Q?cf5bTbyoMzPGsnO+6nklWQjXy2VSAaoqwAqPEikqxNmm89dBewDb/gv8G8Yu?=
 =?us-ascii?Q?TjCgG94ypWp7+HPLpKBmrsTg8iwsnAFVCGhydwE2JmaiT0pSzYWoP9kwFOdp?=
 =?us-ascii?Q?T1OSKN2824+PjnU/7k3EuJzAMYKyQOckHdod2AlI3uDMcVG4hAlDwErRxwfu?=
 =?us-ascii?Q?0VfxhFKMi1oENz2F4e9WNlycIwS4+XiXE1by+0EEnSd5rKVpFLOL8rA6xEcv?=
 =?us-ascii?Q?IuWzlu80pxsWwYc4OxttwWlkGp5V7rev9UgUdW93uGTeMNjLwzz+tztY4xLw?=
 =?us-ascii?Q?P4Jh4zPXyWruuyiZN2zb0+Woco7pdZqr7lkbbDVmA9t1G9mFNQHLgOgFw+OV?=
 =?us-ascii?Q?9LlI0+3bYvaLSCpBMMfBx5FijKmR74ijqcO6iENvoP2cSe2Al1bneupx5/oV?=
 =?us-ascii?Q?J6Gs7Z2MuIlKeE1RWSJGT+JaoWO6hqGS+Z/F01YhSOsKJUl5QoIYx9d5nLT1?=
 =?us-ascii?Q?KIQeAYV+zrBJoMXbj+2cEk+MC03U9XDnCdjq3AzkCPq++uLjemL4EJSb9jlb?=
 =?us-ascii?Q?THA8XY/SCyDwE57pGybcl/xUfgv/l/hC+hSty32bO4ukFon6Kkpj02bk1CcL?=
 =?us-ascii?Q?2Fme2oDwavqtgR/U4IMKtCnmigcL72o1TV2A78LEYOExVChKZOni+ucC8/gf?=
 =?us-ascii?Q?QqlZ/bzI8hnBHJpYyN+QBXQt6a3imf9Xq+hYRwkv8T6uWXqhDrq2amwnV2nt?=
 =?us-ascii?Q?+XanCC3OvrAS4NodaY0lgGjdKEYOF5iX55SWNdjhYzkRgTa0tIZpyfomyS5p?=
 =?us-ascii?Q?Rj/hZUCGJls52DyZgz9ohEZZ2OOjyB0Km/AbNvak5Qn7VYWY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2e20c50-bc38-41d7-fea3-08deb040d82e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 16:09:28.6308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xzty7nVYaW5THu5zSPggGEM18Ww6swKrzEIANHaaC3p2FdBz7pEqdKAFSD36K8FXxrcYcpjq9AnYT43pQqnShg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6866
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_170933_400168_282CBCB1 
X-CRM114-Status: GOOD (  14.47  )
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

On Tue, May 12, 2026 at 03:17:25PM +0300, Adrian Hunter wrote:
> The I3C master workqueue (master->wq) is used to defer work that needs
> thread context and the bus maintenance lock, most notably Hot Join
> processing (which calls i3c_master_do_daa() to assign dynamic addresses
> to newly joined devices).
>
> Currently the workqueue keeps running across system suspend, which can
> race with the suspend path:
>
>  - do_daa() may execute after the controller has been suspended,
>    issuing bus transactions on a powered-down or otherwise unusable
>    controller.
>  - New I3C devices can be enumerated and added to the bus mid-suspend,
>    registering driver model objects at a point where the I3C subsystem
>    and its consumers are not prepared to handle them.
>
> Mark the workqueue WQ_FREEZABLE so its workers are frozen for the
> duration of system suspend/hibernate and resumed afterwards. This
> naturally defers any pending or newly queued Hot Join work until the
> system (and the controller) is fully resumed, closing both races
> without adding explicit suspend/resume synchronization in the master
> drivers.
>
> Update the kerneldoc for struct i3c_master_controller::wq to reflect
> that the workqueue is freezable.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
