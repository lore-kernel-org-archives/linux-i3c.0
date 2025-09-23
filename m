Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA15CAC5AC
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Sep 2025 21:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7tPYvQxSfgLkzi3R+7UqBNQ1iY+jgNDhtsy4KzLaU8s=; b=WBCEoE5/RVeqjg
	x1aLTg1dBx2EO4npRab5D7okbBhkCC6KyXYkd+WYhbsxcGAX+wWpaUEvAk8t4xWCYb2+1RU76vvos
	x0WcjiAbzzxTYZadh0huxJLyZ/02uN+wsO2lanD3eDQ0F78MC8wiiMk7VevdKJqnfiiQ8rVmWlpys
	uyNtJ6Xkz8ty1mHpgY6ChHHHLW+SYh2eM7yM0N0+giOPC6tw7auvff7VivvoG+YMgYTFmv6/9lz1L
	jGwb6v+w/KPj8mIN5O+LeZNzt7Q7VCn0nQry6qGaVp4fBwqhXXPQ43CvX6zg2KVaZwmS12AwLJgZS
	DfPoEWk7PvyVfU/NNp7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ARF-0000000ErL1-16l6;
	Tue, 23 Sep 2025 21:20:41 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ARC-0000000ErKX-0g7I
	for linux-i3c@lists.infradead.org;
	Tue, 23 Sep 2025 21:20:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LuBZASWpYKbczlo009RmzFHzhvYxfSGyiq3Lath8IGlQPg+0lsU/YO7eUOCRVuhUfMmVm4i4In5gyHvVQJ0iS+Rt8dDJWRincoKo78Sod+CZ+VrGwLxgYZHi8I8e0c1HPnFt7SiGsvvK7BwI43RPfkYIoVu4mNnBKzwePtufy3CMTfgzdzioPdv/fPhG+uCJkl+rQyXQwkkawTfaWKkSLTp3m3hOlQkD0CxJRGY8S89czMWgggns9DEZra18smMyiLkHijZ6kUHCZwzLc3u9vB85+ztLhGcM6CaLHoaOvitHk5j5Q/e3EDg9zXGUSnyN4lSYgyAz5wYUQWtxufhv3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/ltTEweAIdBRy5BUBMRGif/ENZ7yhXTrke0qcEA0K4=;
 b=qr3QbKPmuY+xTvDmY09y8tIiY6UuwBCekS4K59t18SWzkJaGd1GicttTVDCJ9oZBPmmVCp9biz/FIS3GFQHsvDcxgio48pYJvBYQfRozD+Sg5VGL6bRYaFNZIvzjegosczkgowF+T7LxLwDF9vtTW0ODLuBQXouD7m441e1w+29J6nIN7jLUErTkrjkdaMAT7CVRRxdCZf6o3+nupGG6h5HPiz/8fPSCZzUwoJCtYpDIPfs75AHaEtZ0rh+ogxCGukwnmzkgWLbAytlYgVozMkqbuZgPjSoN8vIxtGyhz5YyJ7E+smjjDn7dGLwejih7W1f4l5LS/2SjpRZ1AZgcMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/ltTEweAIdBRy5BUBMRGif/ENZ7yhXTrke0qcEA0K4=;
 b=HBci7kb5s134PQKQa2SU6NY/fuECFXlYSGQEIlEomnap9gzJ1a7funuP0rIv9A1gJIxrEDdMxzYZq1muvJIdEMVkyaAr4FCEDSNzwsVsFp1KXhzJKpmwFQ9w6pmAMXpVh46n8sDQ7xf31d8KeJZnTsYG5EP6grM4e18SHdxqrP2hQAAlRDouueg0+jmFZLDkRWgY6LfExTyG9k5m1tvAM2sg7YLGKOigk8lvqkeAUcsyrRoR0ubL9p0P+WGGkmg+NBzEuhlXr03SCdoyPyFijaYrE3yS5fTncI99lzkX5CqE8R/vKBgGT/+a+x2zNnb2PA/n6N3hb9IKsAOv308T0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DB9PR04MB9257.eurprd04.prod.outlook.com (2603:10a6:10:373::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 21:20:25 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 21:20:24 +0000
Date: Tue, 23 Sep 2025 17:20:18 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: Remove superfluous FIXME
Message-ID: <aNMPEunn+Dvt8jaV@lizhi-Precision-Tower-5810>
References: <20250923203557.18298-2-wsa+renesas@sang-engineering.com>
Content-Disposition: inline
In-Reply-To: <20250923203557.18298-2-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: BYAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::28) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|DB9PR04MB9257:EE_
X-MS-Office365-Filtering-Correlation-Id: eaf87b6a-8399-4b4c-cfa1-08ddfae702ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|19092799006|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bFBAx1h46D8GRUoJVsvC/wz138s87Yvsu88bAWMQTAbvRnigPnROFVusnNxs?=
 =?us-ascii?Q?oeOv3lhCN6P4n1/GK45Jc+dalSA9MVLhXTwWs65ED1935GP4rdCQFLjOCICP?=
 =?us-ascii?Q?eAmEu7/Of67xW5O7CGZUp/6wFyXtPyIYgfS8/4lZ/vnfqFrr9B1xnOVHj0pQ?=
 =?us-ascii?Q?kCsFyxE877A+BZ5KSbvXplQFXfh+1UseqNilwhMQY/hsY1RMi1HNensoGpIG?=
 =?us-ascii?Q?FGzUkdLYUPdUb6GuDPqMtx7SyfL8eP9t8HCv02lzggRDpgMwTY75ilD6Mx9A?=
 =?us-ascii?Q?wiu7oTu0AqLgEAA2pFGZd1MmooVYdNqcku9OmE+uDT1tvh3yrIetNsv8S3cZ?=
 =?us-ascii?Q?wBUOnd0yY5Ekl54N4jwuq8eEaWZnN6gz1PBLUhm4UUW0RfPtQq5qsf77H4EM?=
 =?us-ascii?Q?UXIw88mS4HI6ZLOjj+BR9e5EwSmuQHXZQPMhuAoY2IbLDEWvOjOWNsKWoZOC?=
 =?us-ascii?Q?VfCc1HJdGJH22/Ny0Zm9bTJOYCCPZeAp3a/g0XWrWgpHM2mQOhGun6d67rnj?=
 =?us-ascii?Q?iMKFQ4hyD+aDGBjmYTtlB7FkzBxtftAauQLI/4Dk+7RKNlVOXTpHRm1oayo4?=
 =?us-ascii?Q?I6ujqHPzelrdSZ+Byp0o14s7OCPPSoTrkcc3iyhMAvD0HTei3xjExUXf2C9r?=
 =?us-ascii?Q?yS+aUMjij3p1Lm6r2I60NdRirD7ewsrg0m1TH28VrAy6J4zmC1Mvfpra2E49?=
 =?us-ascii?Q?8Ru6GpJwhR+sw3j0s4tE+/DGkXnZ1KN+j4TLzJbHs6FateypF3FTf1UAuwV0?=
 =?us-ascii?Q?R+MDs9wjam6fZBEGrqczOAnNNfoyFCxq88UXi8Ex2QbxV5FZ306AtGJLWSHO?=
 =?us-ascii?Q?OrXJcMv5kNwor4MW1ZRfyvqu6KzNHswV3cMIItkpNSGZQ+oIAVQ2FTNDFTwx?=
 =?us-ascii?Q?dplFqisMiIzxJuEzMipXLQaMUWN6rp2Z+lV8cAXM8qa9WgtqM+8R/y9qlfK2?=
 =?us-ascii?Q?ekziEKgrYdppykm+mMT2mlW5jedAQTWrxq0bx0QG0I+DiDqX3KFdc0GhTwqJ?=
 =?us-ascii?Q?4FJ5QUpLJZ+7gKVJbhZwK1lEBSSB7rs576/rk5eXvjqKXHcy2mw5LaCsDzUN?=
 =?us-ascii?Q?Nr0u7Fa1AyLTQ5Fvfc+uSXarmWE9OW42YTUyIlpriFtziKAvpF6u8fgR3OjH?=
 =?us-ascii?Q?0eaNlJbWAWTHKg931mlIjPS6+n8yMI0tz9e/AdhIuggsAgTBldrAvhYOtLoC?=
 =?us-ascii?Q?mCjQqoqoX0Cpjq4NhRnze1IOM+irFgNennK8KGP/4fhVSH/SeU558WvUgaDo?=
 =?us-ascii?Q?2aP1rw09b7mpb/O6FIDEVBJHSqYEU1tVvwC0Wa/wXZJ4AfwP1InvsDCW2AuP?=
 =?us-ascii?Q?z3/ey1R/pWxJ2lt8YyRrK8++T2qs6+XtbCapV7Yx5hTcnSoyL+RYMAkDkoBz?=
 =?us-ascii?Q?CkBWY7IJigePVogvzu2ConSM6lPXaVPoJGBoC+absicnasCLl7wFJY7u/Mvh?=
 =?us-ascii?Q?+RebyRt8CFgjAUAHOwcJfED/afGLuNvzJvLe7417tu3Hd7QR3P0tEA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(19092799006)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E/D+vlIj432KFo+JxM01gN4ubJ0Acexvjc67CF55F8y+bnC+UUuLO0VI5VrA?=
 =?us-ascii?Q?lPf3/PDS6s+aWu//dMXO548xOVq2TlE0RxcLcHaEnoK8h3Cy3JDqVSvirZ0d?=
 =?us-ascii?Q?oDRaUDqbDyS/2dKlQ/4sg3t6b0+8rHCQfWdLjzS7E+Qvfp+8FYM564bhXalR?=
 =?us-ascii?Q?7tfuS4Otzij8o+Cyehgbac4pioVOFT9iGln3j67wdvRR54qIthbsLsKvVVDq?=
 =?us-ascii?Q?cMCS5/EwMbQ5cXFMXSw/nNN6uqo+VUWW6k96k/ufNNMqIpy9CADkqKsCf7UN?=
 =?us-ascii?Q?hCnDplhkGa3PWpp7uEXt0tccVyoJ121RwsfdCKve4BDaHyne1C1Go2cB3DY3?=
 =?us-ascii?Q?Bcx2quShdDwmTB1bgp8r+RmvhJcy2r2IQ9bK7aXoFHjmIqJKffHZP80k44c+?=
 =?us-ascii?Q?b9/61m3x87inePd4iKEDBszqkGjWhIL4aNb69hlJqPtvy6n4dn9/VPLcbcRW?=
 =?us-ascii?Q?HBVbkMVGi4j+v/cAETPx//Nl0IeIO74AHCiDFkWO9/XVQZwDB+2k+TDn+xsU?=
 =?us-ascii?Q?4b3h1yRu8WH8FhQYJZcSxwFntY3ozbGxBgZ7NaGhCOpBXcFJkFqzPTKHoqdq?=
 =?us-ascii?Q?tq9dNbjS9uICIV8RI/udPI9e5un/WecpVv+/MOydA2uOH2oofBlvijac99Ri?=
 =?us-ascii?Q?x+YcWv6nAmMHBlJkoqDfJNIuFWhcIPkpD1RBFmg+G5uB/xJSFaIM4OrA0E5j?=
 =?us-ascii?Q?qVUcKb6356pq4RUi69HXvF5nnpcbeBz0MXmk3wTrczjEzn+9uOHjxYdxjCaG?=
 =?us-ascii?Q?BT4qupBqR+VdMtsoHEUl2AhpFh9Q7ew7NsVvcVqfItcMTWTqsVLNCzaQ4FWr?=
 =?us-ascii?Q?glBdmNpkhv35fAelp9IlLAZ/T3xgswJoA87NGF+ImKCLoX8wWdh7qe6n07mL?=
 =?us-ascii?Q?SM/kJpRe8+3ZMHryj9sN1joPPCMZGi5PEBKJ/Tp6A4yfViz/Oms5ZS6BSoIA?=
 =?us-ascii?Q?V066whcnCSC+qXNAQxztDYwmLENigLVn7e/SVBgYGUCw/mmUsQW8Eu9hE4sM?=
 =?us-ascii?Q?36D5e8bERGEAfQ5a+Fu8MmXr8oHuIi8TyrvrhzAJZaR4HFTZoOZ0TvFw1VyC?=
 =?us-ascii?Q?qRFiNT9BLkcydN33KMga3XI8k4AxgHjW0Pvt1l/Bo6dDff0ZEs4RbB2+5Ylb?=
 =?us-ascii?Q?5LPnmOd5FWk9wVKSkZbKnwySeGIIXT0+MLRNXs+R4tOitqa2NWs1Gi2kchZ1?=
 =?us-ascii?Q?w/keEb5zGJon9r4N/r/4o1+cK8I4laWk3koby8QPrVCn1N4VU7yPf6yheAEc?=
 =?us-ascii?Q?MOFf91+/ikGV97kyLr+zKdIVOot98fEQXIY9UJsCEhbMRa6p9dJteoxdXQOx?=
 =?us-ascii?Q?X2OBSJik0QrhLKGDpcOkvnZm9zQb6NDYfIujrOFqihxxjbhCNlkzuhS+iPK0?=
 =?us-ascii?Q?k1yR6Fp9rbtHmbMGYk10rSVT8ViAFLzUhhQlgZ6hISeEHHmPNZKAJgz8hPaA?=
 =?us-ascii?Q?ttTo5CQfn7STMLd9tVfMBF8n+Y7EHVI8+zW1HnjRE12LdG4pFxgLStVMTlvL?=
 =?us-ascii?Q?r9C8xUmtpWroX9yVxpTzI0HKi67hhlxeFj3PTS2+GS34sAZC5NdtkGpoE+Pe?=
 =?us-ascii?Q?JZLwIyrMu0gAV7ejlKWiGpOIPdgEqlj93WWLAdOx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf87b6a-8399-4b4c-cfa1-08ddfae702ac
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 21:20:24.8731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nto7tuguCA65+sC5iY+hmsuDIQHGH9vV2ImG/DTWMdU4BXyvFkjPodXR30H1l5hs5NW//4NqLVg6WFLF50LMsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9257
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_142038_210513_F16C376A 
X-CRM114-Status: GOOD (  13.76  )
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

On Tue, Sep 23, 2025 at 10:35:58PM +0200, Wolfram Sang wrote:
> I2C adapters can already change timeout and retry parameters via IOCTL.
> This allows for better tuning to workloads compared to per-adapter
> defaults. So, the FIXME is not needed.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index acaba4d53697..d946db75df70 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2564,8 +2564,6 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
>  	adap->owner = master->dev.parent->driver->owner;
>  	adap->algo = &i3c_master_i2c_algo;
>  	strscpy(adap->name, dev_name(master->dev.parent), sizeof(adap->name));
> -
> -	/* FIXME: Should we allow i3c masters to override these values? */
>  	adap->timeout = HZ;
>  	adap->retries = 3;
>
> --
> 2.47.2
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
