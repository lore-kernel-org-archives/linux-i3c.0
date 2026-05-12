Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564D9CD343F
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2026 16:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DDHCd6iL29pMkI2BUoHe5GDDticzm7WDBt+uswWf634=; b=1E+b30LqVqCiGX
	fy25dHtmU8V7HMtoGkVHSob9Gl2S9gHJDqo9EhvzYOxsHL6kpxlrfi4uV2JYV1crKcGHEwPr/15fE
	UlagJBszAh5EAXGX4/H6WauB1MYvWMJ2/txvVf20sBREtgoTzF4HDvpwtuCjeOr30HZHRQn2YhWWm
	jnQkTrVh8VQalnZY5nxUyXRIJXjiBNsv9k6vcSeWyrwm696+62BhqQPDXlS7YAMgnbU+BoXasnfpx
	i+nrrz11GiABgdhRpFKDcgz6h2NHvjtpD6pNqsKMksF37uiHvuBCSY6Lde47sNAewVMRGfQDHWk74
	1E8a4Fa6+cpsnpvA8FQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMptJ-0000000HLfE-19Uw;
	Tue, 12 May 2026 16:23:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMptH-0000000HLdl-2A49
	for linux-i3c@bombadil.infradead.org;
	Tue, 12 May 2026 16:23:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vRFJ1Bt3OxpV4Ig1rVzcqnsLxwfWXmfdNnQIYAXyVhw=; b=CEfDfvM6oQNX3mBGuIPcFwvqux
	6TAaSrC1Ikb4MojudYKDYliRfRcg0enA7ck0aoN7hQXk3/Ahcjo+KxVq0tAElyqpmPse0pN7ooNdq
	iqjreBXoJ6TsaO6srCggdE3DVV9zoxvNMIaRz88FKIm/WaigPQ+FqURkdAezyVTprOEBVmTNSiP85
	sKPrWbedk3osMsWryLnYSfWlEH1Yk/b2UqvRoTfUOWdH22sxhqb6keZkZDfv80vyt1e8R9kHE2r+P
	q/wLkhONodM/zJyrjQP/7TCNGPA/cYoHELVR4N5eQ5bwvDoToqOft1fG6uYWPszx1rR8pFGzI3ZP6
	t4GTvUqw==;
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpiC-0000000FHDP-2EsV
	for linux-i3c@lists.infradead.org;
	Tue, 12 May 2026 16:12:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FT36Uhp4RZpKGvT1XKMb31J4px7pIAuSgyy9wYaavyLshZdyaBYjWj8WRKTM9GfuwPLeVno/dtNkqU+7s6vOBCVV1GoH9rx2CLq7XOBUO4n+tnGxA2cKKEkDgVoat/xy9in9+Axmkzu/jy9GncXwVsu8q8gzBUALwYCkq/ZMFppWyrS3T9H8wzVMcNjhc+fI1z4ETYJicVpUavthRiuZw0Fqe58mHT8M6F3m0CE3UMgvx9vG5sY9NTEdSeLSdlFUpBXCdzgM75krXZ3EyA59U1RgX/mKRPspMjkiZgbm8iP+d2IHLvnhSQ8YkICKIvl5mkz1q/vK7aIvUXbBsTuEcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRFJ1Bt3OxpV4Ig1rVzcqnsLxwfWXmfdNnQIYAXyVhw=;
 b=flQ9J1gjZtm7uypupDIQAkcAPt5o/3gNwagVe/Y2Nuuy1jnwCKZx7D23pYAsiB1I6CGDK1FKihGhC9CR2Ki5NRznJ1dlHt3L00f20oktX2Yc/CVlO2P7OBh1tpzP8fOyl4wTSoOhlXIHM2feURMuf2CRslrbUkqoOwLTu6DyhZdsKbn45NS6EuKICpP2mtfmF+tmpEe+rmg18RJk2UYZrevYz5AP/pOStKfGXDHdNzgJ3wZ2kn0O9mz0eC7sOE8wnBUoM8ViQFIb09WxL97XlNVtnq7cosn5+EkYPmil/usBHA7zhE/Sn1Y24otfxEcc+f0K0OthViC1IaIkwkRmpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRFJ1Bt3OxpV4Ig1rVzcqnsLxwfWXmfdNnQIYAXyVhw=;
 b=ZVQmY3m74k5qa9wgQSrHH90BBl3e7Iqr4IHVZkVbdczECDAoMn0XRfTwIDv+jmCEkJWyUTqyyFPiQqEhEIfie7zZTY+PSMybcUZECyorMorovBsq3CtOfHHtwaP+DjbTE6Zb1GqjhoY8aFzkFni7knkLzPr0jeFcNYOPoEKGRzI10ZErSu6FZ6sQpUxECY3XIJKOEmwfczflMu99GfqjhgiPV2qYGqtE8TwfLeVPAfO3jicB5a0ihYlc7TlMbxSYl915uRa5SPbzoVQVpuZvG8i8SyM6RzCyd8besSgE/CGSctbpaOi/2ci2MvUduMam00QrFBkJH92JVJxBnre1UQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM0PR04MB6866.eurprd04.prod.outlook.com (2603:10a6:208:183::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 16:11:57 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 16:11:56 +0000
Date: Tue, 12 May 2026 12:11:51 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] i3c: master: Serialize i3c_set_hotjoin() with the
 maintenance lock
Message-ID: <agNRR1wHi_FhHf4u@lizhi-Precision-Tower-5810>
References: <20260512121732.406009-1-adrian.hunter@intel.com>
 <20260512121732.406009-3-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260512121732.406009-3-adrian.hunter@intel.com>
X-ClientProxiedBy: SA1P222CA0100.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM0PR04MB6866:EE_
X-MS-Office365-Filtering-Correlation-Id: efbf2ddc-2b45-4451-2345-08deb0413083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|19092799006|376014|1800799024|366016|38350700014|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: YurZsa8sY4PwKhjWTTkQmGg2svB69vUN2F+sCXMYeAQ+ACv3z8ScASoj+gZojmV4KOgdfw67t1FzjUrr+2bMqtX5/Ylty1bwH2ZdkSbywnNvRnjje/4pDSI/E/SjlRrsEy7Ue79gAkw7OdByCCb/XeBs7rFfQBy0/3DqPhtZX0/qKt/SXvWX88OhyyI5Fv8paYXK3Bln+p/g9d/lZUuwWlRVoBAdK+uw20vflSq9iR2aaWvpyGzcz4ljJmDHoVW8sG8X3pE7aKzsFxZ3bpHHKDVXyM7BpwEl1sPcBkbVCY7cHrvccQxIMqNnGzX3yDqsIY5p22pbJ5kprSWtGUuX6VbWNnNUfDNPwqkkBZ16AdPc2iA2V8dIFV0jLgm2g+zMdwQuOxIaUzFLUVyhuFkwJxCVlk99s9/XqO8mVIuI/EsRt5Yw57QRuUEYJwMqybHgQUBnoarCzHkLzKaZnf71V8WJtJi+FBkbr1u9reOz/xDNCwXR0s/ksFpLFthZ/po4Ua5mDwJ/rVQNSGd8fFX45y/DqbTMvMdzqXqdwnMTyTl/D6JTKzpAIo/NUbqFsu3cu2cEc68EozGqX1taVva+ddRC2hfjPLjxR9dWZ1HG2C6VUR+Wf6s8Bsps+sQK40ZjJHhfNwuc17anP9nwRLakAK7V1TPKyAYJZFZ+yBZPjipqu+hetqt377QU63uCTAycG28Gb3W0YDV6GWnmOgLJfANFS3IUPz8kkmmS2wZLSiifL9KZv85C4uN9J/z0bwww
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(1800799024)(366016)(38350700014)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?628lHHzyQ+fQTrkj90SzI4ZV25Pm3y91X0NLxdWlLQmIXvmwP8lAdz7tPb20?=
 =?us-ascii?Q?bzhR++YI07rd+m0pdwkRbU/sJg5aIyct15berrWFs3Yspa6NBzFy+Y04aUfK?=
 =?us-ascii?Q?7z+oeOPqoi6ZSN/z8as028Bl7fsnDm9sDZoLpWnwsIcrAHz3oyXB5NDnjMaJ?=
 =?us-ascii?Q?UWCImnEMoVZhuhusaGECtHHMstGpb7VZu/kDyVkr3qqZ9nDnEfXx3ju2WR7x?=
 =?us-ascii?Q?aBL/ingHYEZ6VC9Tg88iK0nduWT9EHsdXaWZgKj/OGbOwqY4bGTjTjfNEkCV?=
 =?us-ascii?Q?tEXLXulTIZSgCMFY6HOviBviLTeo0yQ7CwWlVabXbu8LcMYdiqP4sEa2mIpv?=
 =?us-ascii?Q?gFdFFOhnJvpR3i13GkGQTySltfSvxK/tpJVE8wrcAb69khCpAfIEQoNmWUAF?=
 =?us-ascii?Q?RMSS6Ij/EVUqb0xMW9gh9zJ2cES5woVe3Nmrk83anvVzdpRItd2zgF7hdS6a?=
 =?us-ascii?Q?VgL9I/wb7zTI9D+DKE197LdhO+ghwU1aTe14vre4nLMr63LfAmzaSMFcxoqS?=
 =?us-ascii?Q?EnyXGLYqzp/JMbMxpLlyEFi15CimVbfEOpzHHGUxjO4S7rHrz3t6dngmLEgf?=
 =?us-ascii?Q?N8PSoAF4/ssUQbmptC8AaYazHK08+nzSXwzgW8+GYUwUnNnC6IaaMaMK39XW?=
 =?us-ascii?Q?FTuY50D2r8X4DWIbDpYpBOpVJz1iiqVlJSN2dNl9wo1vmtDCk6gG3xRAH3yR?=
 =?us-ascii?Q?pAWBIs1pzIbblnObGA69PBcbl/i+7VWnByeTzkPN1uTvEGVUnxtDsVXbw6OA?=
 =?us-ascii?Q?RUfNav1Ai3X4xI4eQz3qK6KZ6eQwwLc/+E5i9gsTexS89f+F0IfWxuJXr79V?=
 =?us-ascii?Q?S13RtMDWRhSol+MSJUxdZHWUNl9rwSpv2ReArBO7BGaN90RZImRf8BmMgyYX?=
 =?us-ascii?Q?/wRODb19w2JNgyT5KunIo6w9MqLiVbCBxFWNRS5mWtL5tdUistzIgDJhDHcg?=
 =?us-ascii?Q?7lsbmjP45rTnAa/5Nsnh3HGuI0Q17iNqzh3CFuXgLFB0No1WS8zQUEDn0zDP?=
 =?us-ascii?Q?+h8P/gP84b5hde3OMO0H2CghSHVlb4D6C9eOMp/vT7lK7SOnTLPk4mlnOR6U?=
 =?us-ascii?Q?xsk1DyOcFt/tOL2zvqm1KfaY4QeHfRoXXdvWVWY1kc5FFRRaC4bu8AvpohYg?=
 =?us-ascii?Q?XQcOL03NlWyw2kxtRj/rlgnwU3kxt56nc4P/ED9eV/pbx58QCfWsQZiib9xD?=
 =?us-ascii?Q?SRKn4XCmGOoRy0INYaaWtsxcedSguukNXCM290mlN/MRw5FkWxdhGPUUJu7M?=
 =?us-ascii?Q?AQqBhwaDZ4g5w8zFKx9KF2Z5F9tcRrzimIWzFBxkGRz+Isg77fyTPWPJoFAw?=
 =?us-ascii?Q?/l1ejt8c7/VlC9Ne/suzitKOsT0TVNoU7rtoKgC9o/kt3fXuxqT+ChzdRAtn?=
 =?us-ascii?Q?O9VFpfFlwEhbQo2bG0EAOy8h2zoA47RFCpepdGiCSo7CBrZXaNlIBbPoQy4C?=
 =?us-ascii?Q?0Dom+HbgIJV88QcXHJSqHmjbKBxh0RAXsSIfzhB0LjctzfPk633YufZ3Icz3?=
 =?us-ascii?Q?yBHR87jChgFxMY4zHHbJgX/U9N8Sek+nWBLlCrSuYZ7J9PwqQNRNCbGgzLEy?=
 =?us-ascii?Q?HwqNvC3aXLVbkc6wRXyZjPYYx2sKSjjlHNjUCcp7YDiE5jVGoHVVXV/o9aEp?=
 =?us-ascii?Q?O4o4wPUHAlvfIgVDBf7kMoSZcQO6w7sbHBG3niI0fQ6MvwVGLVe7ivjGoFM+?=
 =?us-ascii?Q?1SAqWhkZ73g6qEGlpdwbDGrK6Q9b6jgDaVM9wjP+UdTT9HL9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efbf2ddc-2b45-4451-2345-08deb0413083
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 16:11:56.8761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ztaTmxVRN9FtX2cvqgNBLXs0cM/vsp6IyrPgXT0OWmwo6CkF+6dJJaLoXdxeAT2vdeyp0rL7Rl8K3vRocdFjJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6866
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_171201_182204_0C9A2E60 
X-CRM114-Status: GOOD (  19.78  )
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

On Tue, May 12, 2026 at 03:17:26PM +0300, Adrian Hunter wrote:
> i3c_set_hotjoin() dispatches the controller's enable_hotjoin() or
> disable_hotjoin() op and updates master->hotjoin under
> i3c_bus_normaluse_lock(). That lock is a read-side acquisition of
> bus->lock (down_read()), so it does not exclude concurrent callers.
>
> The hotjoin sysfs attribute can be opened multiple times, and writes
> through different opens are not serialized.  Two concurrent writers
> to "hotjoin" can therefore race in i3c_set_hotjoin(), with the
> controller op and the master->hotjoin store from one call interleaving
> with the other.  The hardware enable/disable state and the value reported
> by hotjoin_show() can end up out of sync.
>
> Take i3c_bus_maintenance_lock() instead. Toggling Hot Join enable
> changes bus state and is conceptually a maintenance operation, so the
> write-side acquisition of bus->lock is the appropriate lock and
> serializes concurrent callers against each other and against other
> maintenance operations.

It should be bug fix, add fix tag here.

Frank
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  drivers/i3c/master.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index ab11e2d79aab..38ffc8713167 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -649,7 +649,7 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
>  			return ret;
>  	}
>
> -	i3c_bus_normaluse_lock(&master->bus);
> +	i3c_bus_maintenance_lock(&master->bus);
>
>  	if (enable)
>  		ret = master->ops->enable_hotjoin(master);
> @@ -659,7 +659,7 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
>  	if (!ret)
>  		master->hotjoin = enable;
>
> -	i3c_bus_normaluse_unlock(&master->bus);
> +	i3c_bus_maintenance_unlock(&master->bus);
>
>  	if ((enable && ret) || (!enable && !ret) || master->rpm_ibi_allowed)
>  		i3c_master_rpm_put(master);
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
