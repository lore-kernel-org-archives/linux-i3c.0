Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DA5CD8C9C
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Nov 2025 16:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/bl80cCppvhV9z3K9mU2JrlB3kB/HwGwLQguJvKiGGE=; b=3r5fgN5C3Aswoe
	bbpfwo0WCGc561vYF+Fj2GlFMrbZ9PO+00n5+qi4jxfFaPsrZYTszmj9IhX47pD1vWlK2mk/N4XOC
	R+y2TKMUFNkU1BNwd7nIpjImEbQ1YY1COY3Z09RrNcdCLfMY3Xhb1CDkL99wvHmXm9QImzXQWLqpo
	nCivCAnJiNQiWeNtOH1gQ2+FSthqw83rpzhphy2GLPGWVk9Mii2pYp7e1kcOXyFadKmQzCEn0p/0h
	jjDCF/dPfbebuftz/KFzfgsr7LPXlUDn4qkwKZg41lNXpcYxt+VgkNEa/vpZiROIeqljSVEdzJO4w
	2e27s9Ed9kB3EKwCr4FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJa8e-0000000AnU3-3nbS;
	Thu, 13 Nov 2025 16:25:36 +0000
Received: from mail-westeuropeazon11011047.outbound.protection.outlook.com ([52.101.70.47] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJa8c-0000000AnTQ-0W4n
	for linux-i3c@lists.infradead.org;
	Thu, 13 Nov 2025 16:25:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kR9AjZjVRsbjytcH8QRL2sSEHSPWcMUQ5yVbuwV8YkIDOKHZo7eQBCarKPO66ab3OzIJ8nOVr9USSKX4z+4JfGS/UMlbpyHdRQmD8ToBI16RkU37DHdas07yPdnR3LcEWnxiWDdLTJ81zMn6GGaAi8JnCGeMTtZAp4sy1q4WxQwfPyyDHN4RCitSrcu2ZSQ/ORemYjWLWtDA/tIvf9LUNfiQ9PyvwBKDghVN+nHkVKdMFvPraRICMhBpbKgyUQAwIeNmnDYAP8naG2+WjNiPKu71UkJ0LICkAWCM9SIPLvMZikBl0jcaoOEXIsOJm9EP5NwYkBWeNcgK9sazGMZmxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmt4jtCoinEBgE+6aLeEhyfsj8Fd6B+iTME+dRKlntY=;
 b=Bcac4baSPewlRRYuKLiq2rz3UB6yeyN1HsAJEgk3BCKXelGzeNdNCv83Ye21bPjor7dJqOtnWL4Rs4OD7dOpFrpGLUUH4WCXtFUFk8fDBOFAdIxkZNcoLi4lXRCfZDFxGS0zqX+tUPkcit0rT4SSIS2jnbpFe3mfKe2Utayr4QAkKbnw6RY0aAN5vCzHORgHviyZSUuBbULxa3JzK7YQq/nPMF7cXgxh8yLuiqD7jBxXwqYDZrgC1yfDRFt97mnY42AeK3l3aRsmc7HqYdnNVW8bCIgzMo4J0Vu/5Gr+nblhwJrbhHK4CWqHWCTEJAVdy5sWZBHbZWk4kOUW4jqg9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmt4jtCoinEBgE+6aLeEhyfsj8Fd6B+iTME+dRKlntY=;
 b=kebMGFMHI2bk3QSzAXkgTRsWMY3/ROSHhHtls9bePrk2YupjfyQxI9ZeFJsTMZsdpLmNLys9jha2qh6qtiY1omDfdor4dGoCmXqUD4xzwtSal6SE7LzWWeyUdN7hta8+ackn7HtoSIfvVh76uNN95blWZbCG0u+sFpm5TkoMutufCg34jNSksPbaN2Feqn4dMtDe9KeDF7z7P3C4nt6E0iFT47YOmPz2JTmm5E/ywOBqgdCCHEFFlPW7BYhy7G9v8rRGzvWVIotsev04Br4I93/hTohqEGYvLduwWgqtXuPhglU054kjyDp8worYhkW1oXGJndneKlZvXpjECc5FdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DBBPR04MB7548.eurprd04.prod.outlook.com (2603:10a6:10:20c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 16:25:29 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 16:25:28 +0000
Date: Thu, 13 Nov 2025 11:25:23 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 08/13] i3c: mipi-i3c-hci-pci: Allocate a structure for
 mipi_i3c_hci_pci device information
Message-ID: <aRYGc3DxEbqtjNUM@lizhi-Precision-Tower-5810>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
 <20251112100339.51726-9-adrian.hunter@intel.com>
 <aRS4yBCoVJfecs4t@lizhi-Precision-Tower-5810>
 <2c4c5eee-9228-4790-9954-07e9e9ecfcde@intel.com>
 <aRTrSjchN8vbkhf8@lizhi-Precision-Tower-5810>
 <27b81657-56ed-4af4-a632-b234da7b4413@intel.com>
Content-Disposition: inline
In-Reply-To: <27b81657-56ed-4af4-a632-b234da7b4413@intel.com>
X-ClientProxiedBy: SA9PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:806:21::6) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DBBPR04MB7548:EE_
X-MS-Office365-Filtering-Correlation-Id: c1fe6c07-6b5a-4d15-3c47-08de22d14204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|366016|19092799006|7053199007|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bO4TmQN4pSyyO1iqBY3YXtK43ML8H1fMUcZPovZDoBncS3pJ6ptLLenJ4jmn?=
 =?us-ascii?Q?2oSNC0XTYFzQEv++6Ohf0ClTOgDNunK54BhTArdxKap1hHos1Bf2Dt8irssP?=
 =?us-ascii?Q?HhFye6inQtULdNjjaClbBFp0fGFMnUum6Dgkz4VGHZMIIcDXiJ7Qzi/PdXSW?=
 =?us-ascii?Q?ElYhwlZdIarh5Yk02g24l8oWIrxOFE6YaExLHomtwUZpJiK4XRcu4yAcVPHO?=
 =?us-ascii?Q?f64t6CUtvXjIA3WUuaXbJRLgKOya+AfwL/Zssl7v/no3KiDIw0A2ypq/9lxn?=
 =?us-ascii?Q?Kt29KwhOKv6XgpbIFw5hXe2G+j7JQXIHztaMjgks1msrNGfvR1Mj3BH/ps/J?=
 =?us-ascii?Q?fhiftGiNApHHODOrP4+XDMQhdVw/WrPF0NQvAoACrQEDLXDPYZ4wUSxWdYmQ?=
 =?us-ascii?Q?3DpdqIfAlXMqGWXNba0vd2UlzCXTK/tgKM5hu/cUMRPVeP/8momG7VBx6JaH?=
 =?us-ascii?Q?KiwVPBLMOhIbc7abztdf2Cp62qQm2Xg5cwlm3a1UZpA6hq5CQ84ASLoKFV1H?=
 =?us-ascii?Q?cRkvdg5lpbToVKwJ/YolddSZUDWnEd6XB+TWWyJ5nc54JA6XY5rnMOq7zG+I?=
 =?us-ascii?Q?p7Z8AmHtE+j1xeyOOYkhCubATwnYiZE2CPeR7rbMTSXWmAe1FtqVRtM9FSAp?=
 =?us-ascii?Q?8EidndZzTP14uZXciRdpbOh/zJLbqYAKE1QBnoqjpmsX2GK9KfRr8+T5Llqs?=
 =?us-ascii?Q?MlEa8IW0w7t4Zjd2S45T9so+vAzp7o5f3UA+twFU1n5EYXX/LFbiygGQDaPH?=
 =?us-ascii?Q?Hu4wl3ZH1SRoldc8I3oGE2ED9uyq8sxVRvrcfVz2V6r6vRxXUouMvDVat7qm?=
 =?us-ascii?Q?2fIADfmqbnJQNoT8/ABgV+wkztV2PKKWxyI5Obs66q/HtkIRkxS/XX68F92F?=
 =?us-ascii?Q?IhM6gUg839SMHBxVpAzMwiCRtekYO42LqiGwphGLm3dz9ZLSQih0ZUyBh1De?=
 =?us-ascii?Q?TshomJOjs11gpCaphwn1Jb+NFsAtuVgaKphge6XuCA04ta3lMzz8mhAcpEWT?=
 =?us-ascii?Q?BnRDIT1P8rbMGHWiWXqbDOlsQiW3LRrVsmPSmh2TXpMW+JYe3/IekJZ8tj3u?=
 =?us-ascii?Q?/pmKg/JB43nNXcKSKsQjGuGuzn7mjnGrFuxZa6v04+dyzIoZdVzxJ0xlTSz5?=
 =?us-ascii?Q?8ojBQlY1SSI6zwFfLGsq0uKiu90Rf9viVLwOCYQ7sCEz1tr5zexMVCdVtB5n?=
 =?us-ascii?Q?bk38dbZyXi7NiVmA0o1JlKQhw4KxjsnPLjUu5/4DosPXP8hAhP+axpr/L+2L?=
 =?us-ascii?Q?yCM5kfNWOvtzy+HEViBZ9zcfTxRGVnRYLzWtCK/OxS7R8VN99vykgxPXhHF8?=
 =?us-ascii?Q?zu9DVIfkPv/k8+KYLDQXiCcLbTjM4Khiz4ebWdP7g5oetan7sTmLdM8UwQWG?=
 =?us-ascii?Q?KoR87gXm9nhBR+CRg8lm6/4xIPkqQPVhWNpk3Agd5fYU0qw92gP6j7DCvQd5?=
 =?us-ascii?Q?asG/OLdSnXrEyikTq7M+N/v1ASeno/WOHgX34A7zDJqXqobYHLs88Q6K2j8p?=
 =?us-ascii?Q?dq/FWB8J8PRwl6W34PcqGq5YLUuUFxkx0kv1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(19092799006)(7053199007)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nAM8r+pREPsQZh1VrXfguuZ74pG+HbNqSzjzfZBp3jG300Z+ZcBRAHl43hzl?=
 =?us-ascii?Q?+IiO5HfYes8rOadLha4JuOx+BAcNxWvXLvTyVxeuG3mdQCqcD6Y5McnyR8gG?=
 =?us-ascii?Q?qCg5ENjkJA7Je0cem3JLIdvRAV1SMVOr0BI5QMLFxx+HRiIK4OVXJEHfJoH1?=
 =?us-ascii?Q?BNwnd8aLiOxq9inb+zmKHkUgVBUTX/IlKMCeLt6gL/DzkQuGbA38+25GCBns?=
 =?us-ascii?Q?BznjzL90lSYgAYPLoekSPWnPuLJApCtGFWEXHi3gCaWiGb6WiR/5+0F6P/w5?=
 =?us-ascii?Q?ugjlEYUbVc7oFW3N6kHNik0lhHljYQWuQsp0b9tWVPhh3tARi9OqDQlPoHvG?=
 =?us-ascii?Q?mMP1z1pdyIKhvhujdtl3DoCCv6bOpaBgiaHdJLWv9s/My0ktb9Cgh6eHZpmf?=
 =?us-ascii?Q?HUTZxlJTlghu401jUqi3yFpyx5JvLQk3JdOweRLnv/Vd8PROH3xkDRe2Pecp?=
 =?us-ascii?Q?mambfhQrhgu02LUcGRgNtE3SvCGldQhpnC5noJF07/6pdp1mCJf4jEe/uyGH?=
 =?us-ascii?Q?Ip1SZsuBXWNdZAQlzXEV+tQwrpcXvvr0lQtF+8FuZjbH+9aUtmCGIvKcxYrZ?=
 =?us-ascii?Q?gFqVo4yKGu+FXFIl8AlFvuFuexs7kcCO8TtIAdzeFMDpO2YZXmALcurbVZ6f?=
 =?us-ascii?Q?GpcA6hkPKl3rSwGRaAcfZ+HZZ9+tLh0KOgyZj1lhbYGfEXH3nuBNk83iPNO9?=
 =?us-ascii?Q?NuhHjMA1lQkyz7aQ8YRUZjkcpeZymoIyD/zOlXD9r06BtS1oGBAfxy7aGqfO?=
 =?us-ascii?Q?/GodsGBxqaEXfbgFBY+DOjPAaVWG8DF99zGdjwggQa9KtRtdPDpDaYQ3u66G?=
 =?us-ascii?Q?71RVx74hd0wNWZUAYfA5KPh2QE6AAfT+x6lqLr5lxOk6qYnXoNNTc6DmDKLj?=
 =?us-ascii?Q?oV0wGcf8BPeofZikvZ7lZuhSLRDi2K4jb07M0ZEoy1WRvScwqty8YPES8Uj+?=
 =?us-ascii?Q?x1ZnlsfOs7TW6T1oLTEsNCvnS3bluFYJywv5AM2Hu3OrIAyDQKul0qgP8rSR?=
 =?us-ascii?Q?yKICuCX85m/2WKXLvc54cDniS06rBhDmJhTwaCEUPnPdqhKDV8MNNNYzp6WC?=
 =?us-ascii?Q?lw0hCs9vSRWZATInjSYbRa8t4mysHxZb7tyvLTHBR3zYlqODj9pQ7g5tl+DS?=
 =?us-ascii?Q?/YlB5PpBlog3sWY891flae3Rl6ZB3jTFRlOZvFks7p51+GCdMDDdere2x86S?=
 =?us-ascii?Q?3vObzn13/yRPBrz41h1epWvR0aDx9dL1F/r+eOrXm8gVIPbfWJEmFbgEjOQx?=
 =?us-ascii?Q?ptZhbmJ8msQkTo13+IqteMALjkCq3WPS2AgeoyuH1FiDpG8R0JJAeSHNcJC6?=
 =?us-ascii?Q?e1uKp0qJQCKBJsCl/B3uHxcNTeytSHtuLzYets5JoJ31WMP2HEUZUqznnMWx?=
 =?us-ascii?Q?aLr88UVTevidzR4JNwcvX3+p6JdLr5to6JlNTAY7GEgon3jR7Y5jBICi29yH?=
 =?us-ascii?Q?gIkZ59iHslmNSpG41nI0OTJNdEzK0Fms4idkwy9M79W20ypCfrvuTYK5qasN?=
 =?us-ascii?Q?NHDolEU9/Er8cu/vxhcOQW2F/3ZDyFOknHwZvCGlGc6rZWiLvq+XkEoYhxFB?=
 =?us-ascii?Q?a4DFrRmHZJwTJ4F06Fv2GSL6Miwy+l8kx6hjLbP1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1fe6c07-6b5a-4d15-3c47-08de22d14204
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 16:25:28.6742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RpHfEPb9fN4XefkefVfuK0K1Hch3WJI18wKgaZPJqrYi1+NdptbOR27z69WqQZ01MNdJELyi2mu/o4EZxATucg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7548
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_082534_186936_316C11BC 
X-CRM114-Status: GOOD (  34.27  )
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

On Thu, Nov 13, 2025 at 03:15:34PM +0200, Adrian Hunter wrote:
> On 12/11/2025 22:17, Frank Li wrote:
> > On Wed, Nov 12, 2025 at 09:25:14PM +0200, Adrian Hunter wrote:
> >> On 12/11/2025 18:41, Frank Li wrote:
> >>> On Wed, Nov 12, 2025 at 12:03:34PM +0200, Adrian Hunter wrote:
> >>>> Allocate a structure for mipi_i3c_hci_pci device information, in
> >>>> preparation for additional changes that need to store mipi_i3c_hci_pci
> >>>> device-specific information.
> >>>>
> >>>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> >>>> ---
> >>>>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 29 ++++++++++++-------
> >>>>  1 file changed, 19 insertions(+), 10 deletions(-)
> >>>>
> >>>> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >>>> index b3b6b6f43af2..9fa89af7479f 100644
> >>>> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >>>> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >>>> @@ -14,6 +14,10 @@
> >>>>  #include <linux/pci.h>
> >>>>  #include <linux/platform_device.h>
> >>>>
> >>>> +struct mipi_i3c_hci_pci {
> >>>> +	struct platform_device *pdev;
> >>>> +};
> >>>> +
> >>>
> >>> Is it simpler by using platform_device_register_data(), pass down platform
> >>> related information by void *data?
> >>
> >> No, this is just a normal allocated structure for the PCI driver
> >> (mipi_i3c_hci_pci) to put information related to the PCI device.
> >> It is later used to store the current Latency Tolerance Reporting (LTR)
> >> register values.
> >
> > Is it static value, or does it change after boot in other words?
>
> Dynamic
>
> >
> >>
> >> So it is not the same thing as platform_data.
> >
> > Base on your code to create platform data is duplicate what's did by
> > platform_device_register_data().
>
> It is not platform data

I understand 'mipi_i3c_hci_pci' now.
I think you still use platform_device_register_data() to simple your code.

But need seperate patch to do it.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> >
> > The pci device create platform devices,  platform driver should not use
> > pci's information directly. platform driver should be reused if it probe
> > from acpi or dt-tree.
> >
> > I think it'd better pass down platform data information, which can include
> > callback to fetch needed information for difference's parent devices.
>
> PCI Latency Tolerance Reporting (LTR) has nothing to do with I3C
> or the platform device, so it does not belong in the platform driver.
>
> >
> > Frank
> >
> >>
> >>>
> >>> Frank
> >>>>  struct mipi_i3c_hci_pci_info {
> >>>>  	int (*init)(struct pci_dev *pci);
> >>>>  };
> >>>> @@ -71,10 +75,14 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
> >>>>  				  const struct pci_device_id *id)
> >>>>  {
> >>>>  	const struct mipi_i3c_hci_pci_info *info;
> >>>> -	struct platform_device *pdev;
> >>>> +	struct mipi_i3c_hci_pci *hci;
> >>>>  	struct resource res[2];
> >>>>  	int dev_id, ret;
> >>>>
> >>>> +	hci = devm_kzalloc(&pci->dev, sizeof(*hci), GFP_KERNEL);
> >>>> +	if (!hci)
> >>>> +		return -ENOMEM;
> >>>> +
> >>>>  	ret = pcim_enable_device(pci);
> >>>>  	if (ret)
> >>>>  		return ret;
> >>>> @@ -95,14 +103,14 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
> >>>>  	if (dev_id < 0)
> >>>>  		return dev_id;
> >>>>
> >>>> -	pdev = platform_device_alloc("mipi-i3c-hci", dev_id);
> >>>> -	if (!pdev)
> >>>> +	hci->pdev = platform_device_alloc("mipi-i3c-hci", dev_id);
> >>>> +	if (!hci->pdev)
> >>>>  		return -ENOMEM;
> >>>>
> >>>> -	pdev->dev.parent = &pci->dev;
> >>>> -	device_set_node(&pdev->dev, dev_fwnode(&pci->dev));
> >>>> +	hci->pdev->dev.parent = &pci->dev;
> >>>> +	device_set_node(&hci->pdev->dev, dev_fwnode(&pci->dev));
> >>>>
> >>>> -	ret = platform_device_add_resources(pdev, res, ARRAY_SIZE(res));
> >>>> +	ret = platform_device_add_resources(hci->pdev, res, ARRAY_SIZE(res));
> >>>>  	if (ret)
> >>>>  		goto err;
> >>>>
> >>>> @@ -113,23 +121,24 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
> >>>>  			goto err;
> >>>>  	}
> >>>>
> >>>> -	ret = platform_device_add(pdev);
> >>>> +	ret = platform_device_add(hci->pdev);
> >>>>  	if (ret)
> >>>>  		goto err;
> >>>>
> >>>> -	pci_set_drvdata(pci, pdev);
> >>>> +	pci_set_drvdata(pci, hci);
> >>>>
> >>>>  	return 0;
> >>>>
> >>>>  err:
> >>>> -	platform_device_put(pdev);
> >>>> +	platform_device_put(hci->pdev);
> >>>>  	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
> >>>>  	return ret;
> >>>>  }
> >>>>
> >>>>  static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
> >>>>  {
> >>>> -	struct platform_device *pdev = pci_get_drvdata(pci);
> >>>> +	struct mipi_i3c_hci_pci *hci = pci_get_drvdata(pci);
> >>>> +	struct platform_device *pdev = hci->pdev;
> >>>>  	int dev_id = pdev->id;
> >>>>
> >>>>  	platform_device_unregister(pdev);
> >>>> --
> >>>> 2.51.0
> >>>>
> >>>>
> >>>> --
> >>>> linux-i3c mailing list
> >>>> linux-i3c@lists.infradead.org
> >>>> http://lists.infradead.org/mailman/listinfo/linux-i3c
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
