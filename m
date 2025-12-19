Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE51D7879C
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 16:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UFv+fnAanlr0oMZEejEy7jnLaV6F66g2SdmTy5zrg6M=; b=Ja8OhSlb2rwkQp
	UWoZ8ZZyDG4Qp4sqeOGHJt6CcTSQNiwYVsrJJQvuyGci6Uw9rtsyIzX04arWVnRH9FYy/ESCpjQOy
	iuhIkjc1B7adjLbJW3zcXaNcxaN5s2zsv04Y8Gc7SLCLtbsPdLrFjXZidrNkeDXVF2Hl1pflH1IYc
	wpPJ0SQ7HAEM0OLBUj0O89eepgJs6lCs6E44/9ywYWl7b4yB56rzkUEUKaK6oK6pGUUdwRDcvZsfP
	As+vBblvC8ejeWjlU2/fnX9JyGSHOlWR0vcdFc6yRQXpZM+jAa208y4noW0Pj9YYetG0nQhifPGTQ
	YdOKzDUCAnaWaoqb8klg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdGs-0000000Adwh-2bF3;
	Fri, 19 Dec 2025 16:24:02 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdGq-0000000Adw6-1vyx
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 16:24:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kH/xZ6wOVbklwEJap+rw/fGT+RsFQPEJZj/rgP0sAmpiSnHK2HXUbaAS0kew7qProkcqBggiKBZLH2fAUOg9BHGGPfW0GAvYiBi1+G+eXxp8jUuzwxvXU7t04cQ2ga6xs6K1cZQoALiw/OG+tAWQOq0q74kvCMlTj5Kde1JePjOsX9bxatcTyEuCBO3sNIGUqvYQ2jdHEJxO+NeYrAprA1a9vGHMD3IXfew99Uoefnk4t+WdlxsA4MsJS7r8QyOzyIpwTU0ZQZdpzK1Lc7nHPPlmUC/zXeCwJCOi6hWN2ENImHr/quXsPqUFaLufv2ZS38RNA44pZVtCkKTW2CBPFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TOPjQGk9JvxgcLQHG+RsA6IsK25u/mfcKGYVZxrScI=;
 b=G4FVzMuQ80a1jTcORHdtgTJe12GZykFgEK4W7IGLdk5/aVgwMsk/OOihKpVsPznapkpQIuPbJslcd4J3g+mCwKkf2AVBWP6gL1NZ3wI9ns5h6+Ndem9LSfZYc6rcRvHRU2P8v+e2sOTs/UjoMTZEARm3H2MZAfE0PquvmM8k3v5dGqxTsOEi51d4E1lIZeoh3dB52/F4izunXcGRIOQrDOtPGuthkjscBu3SN6foHDOnwcAktPAns4d3dakzziO9Ii8MqgSncaBidqBP7LhgeEYTs088SWmPLVsMTjJiTXMXxLtZjzLs24EQAizE3mlTz5vgyFysoTGh9yORLIRyRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TOPjQGk9JvxgcLQHG+RsA6IsK25u/mfcKGYVZxrScI=;
 b=Ao5ZMv/kxS0UTO+E+B6oUvqrTqEOOLd35vhhBzghEfK6RWnzYw9BagxjWHDjdgLNeew8R/BiqDle8n+MK5uxdSbHCKUx+sUvj5WhVIrdkdtfcSgQJhTJEpCuRB50HGgcU4pRcQZ2wCyGcA7Hrj09IPOGB8DIIN45HbpDuRDCOnvla53EPhGvjMuKdZe2+aUDZcsQxrSXBfZbHGaSnJC3lh37kZKD82jfyclkVLu8BxuoxBtUBTDIi8VNRir9tuodY0mdLcfWcjumrScD0A1VeOOdypBO27L/vTakTNpglyPrjBbR6jOseD4cQgR8q+FbuzJHrLYc/5cVFjywp68AHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU2PR04MB9522.eurprd04.prod.outlook.com (2603:10a6:10:2f5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 16:23:56 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 16:23:55 +0000
Date: Fri, 19 Dec 2025 11:23:49 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 03/17] i3c: master: Update hot-join flag only on success
Message-ID: <aUV8FUxFm45SJfa8@lizhi-Precision-Tower-5810>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
 <20251219144534.84391-4-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251219144534.84391-4-adrian.hunter@intel.com>
X-ClientProxiedBy: BYAPR08CA0009.namprd08.prod.outlook.com
 (2603:10b6:a03:100::22) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU2PR04MB9522:EE_
X-MS-Office365-Filtering-Correlation-Id: bcdd4284-aace-42dc-bf72-08de3f1b01a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7xVfsXQNhsFM2k+evmEzyg+/7iaPkCM+0ZKnB5edpS4phHta26+HB5gbtFtZ?=
 =?us-ascii?Q?rzXnkarSVLM9qJ199xLbvefeng7FW+YLuB7hn1LJIfTZe6u5ZxR7+rfsYF0b?=
 =?us-ascii?Q?pZDH717Xu3jYVKRyOQcu0ud9qlGdQx2WmAEjkxEyl66pHlePSvzFKdEJ24KJ?=
 =?us-ascii?Q?m8RD0RBDF5hHDsBMOdc2fguoj0wDhdQVFCmpoyxlbPJykRVmRUEwev+hcggk?=
 =?us-ascii?Q?AQzBWeBw6eulkS15zjrrTuF3dE/TSQZ6OaPzChgzYen4lwBPPtVBUxOQuuZD?=
 =?us-ascii?Q?FGOwRngtvEeGWE/cUm1Dv72Cq5pfgj9dwxdWocq+05Zz6RLzgOOIOTiTbES/?=
 =?us-ascii?Q?prkW2eq2bJiHjtpLhn0kf5skRc3dY9CcMnkHHHgyx1IylVJyYswaOWR+u+6P?=
 =?us-ascii?Q?GhKBaz8s3EIq9Y1CvXxg/kxIvgrm5kxOPoInAd/oFkQ+BCOsZRxqCraPZM/F?=
 =?us-ascii?Q?9YqDy+toR3w1QEMtKNRk2A2TmUhZh4Jv/uWJyienytNfF2YBpKVzNEQxXTmf?=
 =?us-ascii?Q?nh7nnJkEubYC/5X/NaFZ1IrTH1sC6Ha/7BbUhzuT1usNDq/fAUrzR9tqUjNT?=
 =?us-ascii?Q?VO0Gucx140w+wpkX8YoCsSch2Z37GqAPRCwwBMexswm0e6Qy93YA75nYvTsR?=
 =?us-ascii?Q?0CPID4ziGNfOy/pKTcVd3gOC5q+fBt3c5tPRN7TwqBgNoglDtXjuJGaJ6+DB?=
 =?us-ascii?Q?AESwaDQ6cqZ56h6xywLogeBE5PA+2wUtbKy2gGrwU120ZMdceag002zErjiB?=
 =?us-ascii?Q?7juKGfhMhtlrTFTlBr4p4uvxYs4sWIUWK5AUW7E1Klzu6IDg5MXSd+eOUPYO?=
 =?us-ascii?Q?RGAZIDWDUdVkC42JM6LSUm2znzjaWTPyImhT02ex3AJK2BVd+4GGjWWxrUUh?=
 =?us-ascii?Q?xEUKqXHVTZPmROzDaKfGPxM5QH1NgOk7TYVvNJck6DhS5pTrPLiEFriEz55w?=
 =?us-ascii?Q?yA4ioor797V3DOxUHs+4sUFQkgupWmZB8JyRmDFfGk74lAzHlj/Ynz6Io9kK?=
 =?us-ascii?Q?lnUdERGTuQeMTshF1kQAaz3/PbOecAYd031UmkObrNtglU7E6Hu4E6AjWUs1?=
 =?us-ascii?Q?xOUvQGFtikJEYHIAZvFPjTOHTK8kRtnMcRPnIgRaxdeMFFPHopxSrjceWgG/?=
 =?us-ascii?Q?4yuTn5ZgxrviX1s60wCEXYUy/M0p4Mdny1Y56CCnHWBzsr0lvyr8ijCdLjA4?=
 =?us-ascii?Q?xlgiLaN1etMAFDFxgqS12RZ/7EQSpBbX9pNRGbTfHHfmdeknbokK3k+8z/o7?=
 =?us-ascii?Q?JQI3Mze2pVnUv5rkICY5C26djK2nw6N7q/qd3TxMlwK1rRkKloyOKk1G4xOT?=
 =?us-ascii?Q?+0AB8E4HTmQBpvydXj4QwpkBigJe8nmAQW3JurvtxAyslz59y0VMG6Fm/kY8?=
 =?us-ascii?Q?q2EL1rB6+77mf4io5ka/mFmRCh1vY7+p/lZm9rnJN8zDiU2OzT9aUj5yKwGf?=
 =?us-ascii?Q?iM9XAZjtLpjGgwK/qlACGYL+tz8J3dIdkpJu8wghcbXVqTfQpKcioxPoRxuN?=
 =?us-ascii?Q?JEH8qB2zxAUPAUFqoc5/shg0sOzqb5IotZMY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gCKuDf6z0Axv1WcIzigy8bpx+/cLEltFs46rs2iqDGeWkjPRyS0EDYNznbkR?=
 =?us-ascii?Q?hcFvVLg8ZnYjL8Ix3jcveLgynvsPqeu1JEBgTxG5PfCLI/U8H9ShqAI37RY3?=
 =?us-ascii?Q?IChx0aSzzonCmyaEuIka4cPTnVCpHXQgR7vBEwYEhq3piYq9KMElmz1NjFVc?=
 =?us-ascii?Q?lX2uwM6cMTS1YmpG39NbUFM61rz6bzy7Yfup1jfg0PPtOWaMO6ZVBXpbcw2w?=
 =?us-ascii?Q?Y9J9o0YVg9fMJK5nf3R+dsrbSXZHncq1gNJ1hY/L6GNYHquMv+Skgt3xyDAj?=
 =?us-ascii?Q?UFqjgZhx0l5Kq//COSmHSNfpiTUIDj0TIPQMxsy/KqivJHjXfTdJCYav9YXs?=
 =?us-ascii?Q?+vp9E1jVDd3GBG9blVUGAgh3uRhoHKTsRlfP0D/vz3AP/dpTAhSoxdtJr6kS?=
 =?us-ascii?Q?jLoooz1MFol0WHbJ6z+Qh9X4vyxMBMo4OOQh2iuVCpyzyYVCV1GAr7zy/Uxv?=
 =?us-ascii?Q?RK1s+rQ94rAvpjECs8zS0erg4x2iPAgP57w5ngxMgglbvY++k/akO44nxgvC?=
 =?us-ascii?Q?vwp/HmFSfVttEJji/5Ui3Q1yIkzjhWilL0xUo+olhKAcnkwZa2p2QqaXGZEu?=
 =?us-ascii?Q?2vhtRyg5RMynrGV2G7ktX+pXt8zzSIQjvDhAuA7s1jL+0QcvAPFr07VdD3MN?=
 =?us-ascii?Q?D2Vwrhr//yyaChAox1PB2yUaJM4xvQ6yEjSSV4HlOgxLMj1ghKk/4b2UeSwT?=
 =?us-ascii?Q?4m1ESVjAB4HOgkxyxk6XMfNa7YAj+bAuEgO0vGT3uA+fEusNA2zSTUxgRTop?=
 =?us-ascii?Q?2tms434yUEPa29Xt3iwpP/wiYP33yFwb8G0aGtYC2u2LXjlVPD53lrtFqXIR?=
 =?us-ascii?Q?4+nOIVna2zR7/jpXan13bpWeEg2HUz63kqHannmmdFYYULV1aHkqtyUD+EGz?=
 =?us-ascii?Q?LLn1QLOqDRekbrkzf15RBWxqqLUQ9/2jdYJw7hoU6ZSFvKWNrcmmRnjOKpOw?=
 =?us-ascii?Q?uoYjXDg+/0lOgo34YkcS8W1JgMIPtJr2Id4Pr4ktjJ+92wxA4EZbXCvPg28y?=
 =?us-ascii?Q?0CVu5qmz9tJG610CAvsQT+bzOPNAJL7c/bcoJiQD/wC0RldSKm3Eol6hczOK?=
 =?us-ascii?Q?Fv+LCSCaxF/WIvNRPNhd9hMnsd5hYBTOwd03bRDKj83FUnEE9VYr6kmwu1Xz?=
 =?us-ascii?Q?bKNTEDn/jqs2omOXCOgjt23bv1iEXefsxOKpZ4A9xmN5OqmzwJamvvj0Ul3l?=
 =?us-ascii?Q?CWLMUd6TtmPUh3SpCSj1U/TdCPt91iyRgeNWB8XPpHISxNI/gxvxbAcnm4oJ?=
 =?us-ascii?Q?rTVmIgf54pQJMu0v9mNtoRRaldzD88xd5eQ7dPRTl+QyaHTwvgeZ0FF5Kbz5?=
 =?us-ascii?Q?k4X1+5b2DQHnNzJ/Wo93/YFp/oilyTMyFTpykK28NN0SZxQ8f6yFSl/i/ozs?=
 =?us-ascii?Q?h9JklfvPc3WT+2WUxrkc2orfDzk/5Y06syBWKYshD0V2Gb10YjbtlSOrHwXw?=
 =?us-ascii?Q?kkHnnLVJM/Ohr2NoXAhMXtW5iB6oUAVjcO53Hid/vDcArasKGpFEQe2Zp369?=
 =?us-ascii?Q?BNe05uuNsAM+o4L0fM1z4LC960lGjBLSPd3ya97JPfh7pIEjBRK0tMvrnGJT?=
 =?us-ascii?Q?tStPX0UZfQYWDyMTdsbkbNzQ3Q9W/rp3tbFzHxDzWZ4elcLMJkAomgPeSsc+?=
 =?us-ascii?Q?MmoPSWARbmsZtkjWdxPenIvIbl3qrI6tSuvtjna9UT0nvLca0fhQvDB7rIpd?=
 =?us-ascii?Q?kuE1c1NXahUHmZM/wfbtKPJn1sAZ6Z/4R1v21JKDw9l5GbvJdpx/ysnyKE4d?=
 =?us-ascii?Q?7y7cum3huw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcdd4284-aace-42dc-bf72-08de3f1b01a8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 16:23:55.8821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9SlkwDGYe3u2VcOT/XIwduBbWE7O5ewuuM9FFvhtn9zLsRSgT/WeWjSKK8OyfSGvcNcGeR/AGbWUj1syg9FDzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9522
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_082400_533390_87D7A36C 
X-CRM114-Status: GOOD (  15.73  )
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

On Fri, Dec 19, 2025 at 04:45:20PM +0200, Adrian Hunter wrote:
> To prevent inconsistent state when an error occurs, ensure the hot-join
> flag is updated only when enabling or disabling hot-join succeeds.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

It should be bug fix. put fix tag.

Frank

>  drivers/i3c/master.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 7f606c871648..e6384bffd4ae 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -618,7 +618,8 @@ static int i3c_set_hotjoin(struct i3c_master_controller *master, bool enable)
>  	else
>  		ret = master->ops->disable_hotjoin(master);
>
> -	master->hotjoin = enable;
> +	if (!ret)
> +		master->hotjoin = enable;
>
>  	i3c_bus_normaluse_unlock(&master->bus);
>
> --
> 2.51.0
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
