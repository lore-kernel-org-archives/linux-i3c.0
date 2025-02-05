Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F84FC02198
	for <linux-i3c@archiver.kernel.org>; Wed,  5 Feb 2025 15:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=chaSSOXmmxG55w/eOUsVSbFHr2EtN4p1n/GqnzzP3gs=; b=mLzRe03YIVDOdj
	64RIrbGOn7XOZdNLr1U08Q1O/vwViO0RdC38KZzp5wTvrLHtiMFMrOSDAMUJ8Lnp5HgK6EBINK8ai
	VKltcDHyXhX96aAnc+YumojOJG4bdTKe4E2oFlVGhvHzVWem+m/8Mw9yAoApdl8G5K2M4YARM5Qoy
	g1yfpC69V6aa4DUafVpS1k/JGzc/LePb9JLllEtOnSuwacNFuz3pZNlgQseEFHo5TTCaCEouFmEX7
	Q7pkh41g1+y414zxS95ApwOtH2cAnQEuwdb2F5OGeMNamtBZKfd0bow9KP8/LL4/QzTVtt8lZ/E9w
	ipl9oAZ29hBAj16P318Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhZj-00000003pMU-3gti;
	Wed, 05 Feb 2025 15:44:27 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhZh-00000003pIx-0uBR
	for linux-i3c@lists.infradead.org;
	Wed, 05 Feb 2025 15:44:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lDpU30n7c/xa6OOVFe7AzLXtgEc7rx/ELgFbit99GkcDkPZa76Jeo++VOczMbKYsIfdgLfbKbtPHddpNWyNfdTOMHeHknLiuH2LFjn6a9EqO9eAMkEUN+6UrBIQ+WRCllaj86LjNsM80ehSU81KPcWLmQI2T7Hr2tIX3CqkEGBOTXgrUyPiV7pMstzH1NPJbNvuHvkeluXYDzzgOis6MFkXqZEZJUWGyLXV+xhTgeqIRlH4vMsNClEyC7XRAJB4NQD0+QIxA5jCoETzZDDQqL0ayXtUR/636bhMUIYYwwu1ZsXXBqW/8efWdnchvszQ4HpZl7QHusDhOshjhrJBCsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ID+gd5uQYpcdYEjnKTl4m2jJCeIoW/RnncAjDatjTZM=;
 b=doKt/lyv4oI5WN0XKz54DBKcSFutBsPAVkos6gdeG+bffnntMZY00IMMV+un+fRjSfiVt1cGqIxczTOWahJ4uoTwfCt2xxaTe1J4zy1mum/BNazwiVzzhCcSJHFDkhovLzBVGdTQAyPvdaWLe4gZYYO75iCu4dHyY9LMiqxwoka8z8V7TSwqPpKEqmDUZyYL00hhqhcxzYdDU+UgaiakXC9yhBnCON5E1KrsxK1+8UgDpJqDIloEFOwI55dWaDGzuuIhl9pQsyFVIPImKtabEGEkYniEJ5iz49/VuzFUsV9y2fFLbONkwqjuXne6asIZCs84OE9HJlY/sej6Wp3TtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ID+gd5uQYpcdYEjnKTl4m2jJCeIoW/RnncAjDatjTZM=;
 b=HPQxiSdRD7ZP9/vO7jDwonlBXwciJ0LOXlSPSrhYFEXKcNCbey7ua5RNp7tNo0g3Y/E9dCTzgbfy4qCC2kPbh1o86CvONQfktGkYM8Mz+zznrGjRQoGHdjwEWd6Nh9fPwFAr9p98ZVYRPgZjdOufkmxCgjCvnG88b6jqp6yPgiwZC6BxT4bxRKJCmYp132oDLCgRyldeee5TB4B3McqfNqlw8wf7NQcfSuoLiDeOd2A/XxvWIPznaRCIS/29wsT+m43uZJuBTdNr6EPv4UOBkuQOOIoFlmePn2sDGvdF8gw2gCt2RRdaxVbY2/59ipoIoKq0kfFdMq5ELWm5u3XgUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8423.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Wed, 5 Feb
 2025 15:44:19 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 15:44:19 +0000
Date: Wed, 5 Feb 2025 10:44:10 -0500
From: Frank Li <Frank.li@nxp.com>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: Joshua Yeong <joshua.yeong@starfivetech.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH 1/2] i3c: Add basic HDR support
Message-ID: <Z6OHSsISZPClbRxw@lizhi-Precision-Tower-5810>
References: <20250129-i3c_ddr-v1-0-028a7a5d4324@nxp.com>
 <20250129-i3c_ddr-v1-1-028a7a5d4324@nxp.com>
 <e09b50b8-dd65-4636-aa35-42efc86bba16@quicinc.com>
 <e28bda63-bd6f-41db-8c24-43f21cccb386@starfivetech.com>
 <Z6DmUIKn5usytjl3@lizhi-Precision-Tower-5810>
 <08098961-ab40-4bdf-af56-c77a24c55959@quicinc.com>
 <Z6I1jBx273o5GE5w@lizhi-Precision-Tower-5810>
 <0435e96d-6786-4adc-83eb-a6aa3766c2d5@quicinc.com>
Content-Disposition: inline
In-Reply-To: <0435e96d-6786-4adc-83eb-a6aa3766c2d5@quicinc.com>
X-ClientProxiedBy: SJ0PR03CA0266.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::31) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8423:EE_
X-MS-Office365-Filtering-Correlation-Id: 03ac6a0d-fc52-45f4-0b42-08dd45fbf41c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?39f2IwZgrjdfp9yzWZub27VzNLwXZJ1TC9sO5sJjwlqdUB3UILq/7ShMOL?=
 =?iso-8859-1?Q?/1NT2yiI7a/sCUxFe9EO1rZbu3cggQbVtOmjiGBkwV6lgKbkYW/uyiTZQL?=
 =?iso-8859-1?Q?SAmZpmoM90+qrLXB6WHBKtluZWjHF3xOzkQ+9J2OVPXfLJX8jSXIoZlqju?=
 =?iso-8859-1?Q?QdlkEuYJ2398aRR/PCCSJu3u4MvWWLd+XX4xlKO2ouO6WtRCqwstG8kR3L?=
 =?iso-8859-1?Q?i1wU83fAacR6DDIeBuTkRQDFOvWeMsAO++pJWU7EOj/WiKaJrjkbwONcWE?=
 =?iso-8859-1?Q?Im7522vGdEGDABnPBetvdsXevNStJtR+g3Blb67ec3FIz/7EPMlNpdBVqf?=
 =?iso-8859-1?Q?FJzwgi+rTNngu7OZN3Vf9szzAANLpD3r7LwRPsEZ0aMXa8Mw9e5GLPGkms?=
 =?iso-8859-1?Q?0AXYW24Y6KbjALulDeGC+hkPIkMVYoPGIhfO4va69WGJmzuEvSaSXlVANf?=
 =?iso-8859-1?Q?LIN6BrDeXfz4YBWaN0rf+W1G2vyvWEVoEbzmi5ZUpfoceUb+bU1rC2oqAZ?=
 =?iso-8859-1?Q?7q5rkth3P3zNqsbtMpu0i3GpKBREHiiB+yOp+kgENHYar/37MN/wJ02JWg?=
 =?iso-8859-1?Q?PhmbzOs3zWmy7mWIIteCQ3sv2x6qcZ2l9gKA6D1RUJNBMKPgbelBTbp0Dn?=
 =?iso-8859-1?Q?obRFlashM72FAaX2qhfE7OGpM/35m7RuT2sqDdConM3mTS1h0jA7gYTJbP?=
 =?iso-8859-1?Q?ysXFOWl3AThOOBLCsksCFgzMsqtv/EjtVXyjGl5OQYnEVOgAAOMtAvJwax?=
 =?iso-8859-1?Q?ufDpzEGxJMz0acHhf6JLMRPdr7AQI9czGM4EbFptMketH7kP6QO7U0mtDp?=
 =?iso-8859-1?Q?oAkBkMXnzs4bUFToMv9ldJYGOXZtz3RDvIptiliCol0BqhSwgFAtGg7ASg?=
 =?iso-8859-1?Q?2BnlPW0Yq6Q6RXeAm7PpyI7pnfb6dV3Nzb0SbGD5QyWwGRn2bTtyhVz1oJ?=
 =?iso-8859-1?Q?ulbp7YvB3FYZMH2x951uz190ZUCppJ6vwN/18bzfetwoWLnjxTYEi88F34?=
 =?iso-8859-1?Q?ExvTg3BcwwZMHzTuYv9T2Ro/zEoY1qmASqwHsud+fWI0InKVXhwKvxCeGP?=
 =?iso-8859-1?Q?UVgmqJB9zKY7ilt09mWjtFjgEMiAU+PGXxqGmnEcPzUQofiZc1mVmkLAAJ?=
 =?iso-8859-1?Q?QTLiVd/rovCFAg42pH1Kx1PonxFmglAouVRGt4krB5dbFUrZ3viRu/dUWX?=
 =?iso-8859-1?Q?EhndFwIasuNYSNZBc2HDaRODQuM8l4OM72k4ui2X/UX/wGKhnGvU/ky+lb?=
 =?iso-8859-1?Q?PegaZWGPyoPBLG98ks0r+XbsjI4YVNv9WT6mZYPkxrPN7KxfaQtwqGfD3n?=
 =?iso-8859-1?Q?erhl0E7HRxT5xitCGOyD1x4xIIGqXNwXMODCxgSOjVaO7FXkdhe4Bx4r2Q?=
 =?iso-8859-1?Q?MERFfJiCo0t7K1zrP7jDx8LiACi2Q03JHpy08k0VY6zaASshm4BGRUCk2Y?=
 =?iso-8859-1?Q?NXalagGIFIWRFG6SMRjclrp3M9eEH9LKt1OFQIeC90nQ+pK9kiHsK0tGzL?=
 =?iso-8859-1?Q?W1JId4LLcL60KehNZas+Qz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?u0azRpiwTPqm9nc2BJLQdaZSeWdvhIDaYP+vkhwjFlmxv6iBsrBGH85yNw?=
 =?iso-8859-1?Q?MU6xjbcPHTwkgg78zv5ROkd9lPA/cop5Nj838EKIeJ6i2LzujjioMCCuqW?=
 =?iso-8859-1?Q?6wCCJatUNnT43AGocXGI58Yz91G0q3k8pQfOALZRREuebCntyNqgC7KwF3?=
 =?iso-8859-1?Q?19lQv0vjghPZBI66w8GLNuLKOhmmkNWAfCLgj1zkHqsjZ3r5R0sdz5gmhw?=
 =?iso-8859-1?Q?qCMwugo3ip5HYDxYNtmItM1pohLljEa7n9WZ22sBNdM/zL8SdK7fz5/iHI?=
 =?iso-8859-1?Q?digyI9XZsYGJXoVLK6rRNRCcLoWob5eSadxOxqjfSOA4S9YXUnEoYKIJx8?=
 =?iso-8859-1?Q?MluWcBk18tHCPjXzgMD+wc4s+14Bz4Nwo7PkAOsQaO/pEnBiRO+i/fB9cv?=
 =?iso-8859-1?Q?ET+lDc7ie8L7Y8OH57/Q/biBLiumUqVPyTFp77FcIvNrtKgaucoL5Vg93X?=
 =?iso-8859-1?Q?Ulx2LDHlEDoJr28a1LLkt/hH3iKgsgzYDdCLObRVWRCGvpgCsYvmQ3ilAW?=
 =?iso-8859-1?Q?uRSevys5U4Viac1zp0Oi6w4GHAqOauxVLmjPe2ggQdLxZCHlclvx3zt4dT?=
 =?iso-8859-1?Q?0OURuVOsGO7WU6Sy0BrRbuv8vd1A9YdU4hwJzkRvrVgCRtb5FomfmaNwFd?=
 =?iso-8859-1?Q?DpojCUfiOaHgx7tTqD8+M6LxfPVln4K6VO5sjYaMlGJm0kRfW6/ZkIuMFq?=
 =?iso-8859-1?Q?dDK/CS/5AmDsSReLYVgQKctRrxX9tA3KX0B3MhKXv8Quy51gMcrcFiW4WX?=
 =?iso-8859-1?Q?TXJ5i/2KteC/qAqBXUYdo88aKfBa0wQb6pr7Fd5LHOxkz+x2gx1tGnzDek?=
 =?iso-8859-1?Q?LQwHEhoLiEQF5Fd0LeYTfriysDy2+iNvZzrveB4pZyj+iCaZmQz0VlFIu3?=
 =?iso-8859-1?Q?ZROOW2s8o665teNhEp7iYe3wRXMXBFm+SGc6/SWqqkUj3yQiFjsWddTFGq?=
 =?iso-8859-1?Q?srHEyqInTUwYVqG8g1FmmhOlI+3cLyb0zM8JR+mnOwfcoeXLVNPC8TayGo?=
 =?iso-8859-1?Q?2Xzr/Nuj3tmQdIhxW6DZavxVDYg1mPk97WerfI1VTT9FooYGwYIsUistrW?=
 =?iso-8859-1?Q?ZGYxYnoUG8WNRV7aReXGrFhRYjNewAVdk/2OFG7Xa33YXBoeW7t6E9cDpX?=
 =?iso-8859-1?Q?h7Dzdn1xOEOs+Fj/l/1ZSIi2VdpwINfPBXGwn2SzC1bRdrHThpOcPuIGwy?=
 =?iso-8859-1?Q?TLRlsRGgjZewgV/7U6KPTCXKo4xicncoAt4b4nGiXMopK86MIzijLtDP5+?=
 =?iso-8859-1?Q?Wnqb+mxQRSz6eYxxLwlv4nyJfDX+cnsZd6/nCiTVtAN/s5zHUdgxgBCE7w?=
 =?iso-8859-1?Q?9T0dDcV3U2XfYECAJMdCxzPR3EOBTtFQVZMlE8Kald/UUeXgeenMEokNyM?=
 =?iso-8859-1?Q?IaZRDuxHi0QVQajFGGT1LwIlxrmEnOSUnv1HH9lDFnakRLF29gx2egrAdM?=
 =?iso-8859-1?Q?mrFHs/2ceXmxjqbNSfadZR0NpEfMF1MMjfZI2Ia//gXZcGEWcYrwzO1zrQ?=
 =?iso-8859-1?Q?R90xH+sUswe5fmoLOYspd8OPIGFoz2TPd8R/zgeH4C91X8fJobI+f0PPrs?=
 =?iso-8859-1?Q?4r5WXZTlPKzVF5pWlKOGH7SXgxp8mO1Og1ZYM8wDJNZeTbjyN1R+rfN3hf?=
 =?iso-8859-1?Q?gECX9tVryzEMOrTvA39ubzeRKYiKbzxzDa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ac6a0d-fc52-45f4-0b42-08dd45fbf41c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 15:44:19.2564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BiHJACad07kUjEJainyJ/8HsVAlosNMiTQUpxoCtusvQO3rWml+Xzysy9k0S+GlcWB9ZI3q0x/cju/TrFKmd9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8423
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_074425_411679_CA70C17F 
X-CRM114-Status: GOOD (  48.29  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, Feb 05, 2025 at 07:49:20PM +0530, Mukesh Kumar Savaliya wrote:
> Thanks Frank ! please review below.
>
> On 2/4/2025 9:13 PM, Frank Li wrote:
> > On Tue, Feb 04, 2025 at 11:24:03AM +0530, Mukesh Kumar Savaliya wrote:
> > >
> > >
> > > On 2/3/2025 9:22 PM, Frank Li wrote:
> > > > On Mon, Feb 03, 2025 at 02:32:51AM +0000, Joshua Yeong wrote:
> > > > > Hi Mukesh and Frank,
> > > > >
> > > > > On 02-Feb-2025 1:54 AM, Mukesh Kumar Savaliya wrote:
> > > > > > Hi Frank,
> > > > > >
> > > > > > On 1/30/2025 1:35 AM, Frank Li wrote:
> > > > > > > I3C HDR requires enter/exit patterns during each I3C transfer=
. Add a new
> > > > > > > API i3c_device_do_priv_xfers_mode(). The existing
> > > > > > > i3c_device_do_priv_xfers() now calls i3c_device_do_priv_xfers=
_mode(I3C_SDR)
> > > > > > > to maintain backward compatibility.
> > > > > > >
> > > > > > > Introduce a 'cmd' field in 'struct i3c_priv_xfer', using an a=
nonymous union
> > > > > > > with 'rnw' since HDR mode relies on read/write commands inste=
ad of the
> > > > > > > 'rnw' bit in the address as in SDR mode.
> > > > > > >
> > > > > > > Add a priv_xfers_mode callback for I3C master drivers. If pri=
v_xfers_mode
> > > > > > > is not implemented, fallback to SDR mode using the existing p=
riv_xfers
> > > > > > > callback.
> > > > > > >
> > > > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > > > ---
> > > > > > > Why not add hdr mode in struct i3c_priv_xfer because mode can=
't be mixed in
> > > > > > > one i3c transfer. for example, can't send a HDR follow one SD=
R between
> > > > > > > START and STOP.
> > > > > > >
> > > > > > Is it wise to add two function inside main funcion and separate=
 SDR vs HDR ? so we don't need to change current function arguments.
> > > >
> > > > I am not sure if understand your means. HDR have difference mode, a=
nyway
> > > > need add new argument.
> > > >
> > > let me clarify, We can have main entry/hookup function as it is.
> > >  From priv_xfer , we can call sdr_priv_xfer and hdr_priv_xfer ? based=
 on the
> > > structure information if its enum SDR or enum HDR.
> > >
> > > > >
> > > > > I think the 'private transfers' are limited to SDR communications,
> > > > > would it be better if we have a different interface/naming for hd=
r transfers?
> > > >
> > > > The key is what's difference between hdr and private transfers. So =
far only
> > > > command vs rnw, any other differences I missed?
> > > >
> > > yes, but can we make it priv_xfer() =3D sdr_priv_xfer() + hdr_priv_xf=
er() ?
> >
> > struct i3c_priv_xfer is array, each i3c_priv_xfer item is indepent. Can=
 you
> > write a simple code to demostrate your idea.
> >
> > Frank
>
> =3D=3D=3D=3D=3D=3D
> Please see below. My only intention is to add hdr/sdr decision inside
> i3c_priv_xfer and rest of the functions should remain as it is.
>
> If you still need, may be we can add local function but no need to change
> prototype of function being explosed to many vendors.
>
> I hope i am not missing any major thing.
>
> struct i3c_priv_xfer {
> 	u8 rnw;
> 	u16 len;
> 	union {
> 		void *in;
> 		const void *out;
> 	} data;
>  	enum i3c_error_code err;
> // Just Add below two members and rest can be passed till end point/funct=
ion
> and can process as required.
> 	enum i3c_hdr_mode mode;
> 	union {
> 		u8 rnw;
> 		u8 cmd;
> 	};
>  };
>
>
> device.c :
> i3c_device_do_priv_xfers =3D> i3c_dev_do_priv_xfers_locked
>
> int i3c_device_do_priv_xfers(struct i3c_device *dev, struct i3c_priv_xfer
> *xfers, int nxfers) {
>
> ret =3D i3c_dev_do_priv_xfers_locked(dev->desc, xfers, xfers);
>
> }
>
>
> master.c :
> int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev, struct
> i3c_priv_xfer *xfers, int nxfers) {
>
> 	if (master->ops->priv_xfers_mode)
> 		return master->ops->priv_xfers_mode(dev, xfers, nxfers);
>
> 	if (xfers->mode !=3D I3C_SDR)
> 		return -EINVAL;
> }
>

The problem is

struct i3c_priv_xfer xfer[3] =3D {
	{ .mode =3D SDR ...},
	{ .mode =3D HDR ...},
	{ .mode =3D SDR ...},
}

i3c_device_do_priv_xfers(dev, xfer, 3);

How to handle this case?

I think i3c_device_do_priv_xfers() means one whole i3c transcation:
START, xfer[0], xfer[1], xfer[2], STOP.

Frank

>
> svc-i3c-master.c
> //process everything using xfers.mode  and xfer.cmd.
>
> I hope you can add all rest of the changes inside this function itself.
> static int svc_i3c_master_priv_xfers(struct i3c_dev_desc *dev, struct
> i3c_priv_xfer *xfers, int nxfers)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > > > >
> > > > > > > i3c_priv_xfer should be treat as whole i3c transactions. If u=
ser want send
> > > > > > > HDR follow SDR, should be call i3c_device_do_priv_xfers_mode(=
) twice,
> > > > > > > instead put into a big i3c_priv_xfer[n].
> > > > > > > ---
> > > > > > >   =A0 drivers/i3c/device.c=A0=A0=A0=A0=A0=A0 | 19 +++++++++++=
++------
> > > > > > >   =A0 drivers/i3c/internals.h=A0=A0=A0 |=A0 2 +-
> > > > > > >   =A0 drivers/i3c/master.c=A0=A0=A0=A0=A0=A0 |=A0 8 +++++++-
> > > > > > >   =A0 include/linux/i3c/device.h | 12 +++++++++++-
> > > > > > >   =A0 include/linux/i3c/master.h |=A0 3 +++
> > > > > > >   =A0 5 files changed, 35 insertions(+), 9 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> > > > > > > index e80e487569146..e3db3a6a9e4f6 100644
> > > > > > > --- a/drivers/i3c/device.c
> > > > > > > +++ b/drivers/i3c/device.c
> > > > > > > @@ -15,12 +15,13 @@
> > > > > > >   =A0 #include "internals.h"
> > > > > > >   =A0 =A0 /**
> > > > > > > - * i3c_device_do_priv_xfers() - do I3C SDR private transfers=
 directed to a
> > > > > > > - *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 specific dev=
ice
> > > > > > > + * i3c_device_do_priv_xfers_mode() - do I3C SDR private tran=
sfers directed to a
> > > > > > > + *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 specific device
> > > > > > >   =A0=A0 *
> > > > > > >   =A0=A0 * @dev: device with which the transfers should be do=
ne
> > > > > > >   =A0=A0 * @xfers: array of transfers
> > > > > > >   =A0=A0 * @nxfers: number of transfers
> > > > > > > + * @mode: transfer mode
> > > > > > >   =A0=A0 *
> > > > > > >   =A0=A0 * Initiate one or several private SDR transfers with=
 @dev.
> > > > > > >   =A0=A0 *
> > > > > > > @@ -32,9 +33,9 @@
> > > > > > >   =A0=A0 *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 driver needs to r=
esend the 'xfers' some time later.
> > > > > > >   =A0=A0 *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 See I3C spec ver =
1.1.1 09-Jun-2021. Section: 5.1.2.2.3.
> > > > > > >   =A0=A0 */
> > > > > > > -int i3c_device_do_priv_xfers(struct i3c_device *dev,
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i3c_=
priv_xfer *xfers,
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers)
> > > > > > > +int i3c_device_do_priv_xfers_mode(struct i3c_device *dev,
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i=
3c_priv_xfer *xfers,
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfe=
rs, enum i3c_hdr_mode mode)
> > > > > > why can't we pass mode as another structure member inside struc=
t i3c_priv_xfer ? Adding function agrument parameter impacts existing drive=
rs.
> > > >
> > > > If that, it will be possible, xfers[0] is sdr, xfers[1] is hdr. Act=
ually,
> > > > I3C can't do that.  we assume finish whole xfers between one whole =
traction
> > > > (between START and STOP).
> > > >
> > > > Frank
> > > > > > >   =A0 {
> > > > > > >   =A0=A0=A0=A0=A0 int ret, i;
> > > > > > >   =A0 @@ -47,11 +48,17 @@ int i3c_device_do_priv_xfers(struct=
 i3c_device *dev,
> > > > > > >   =A0=A0=A0=A0=A0 }
> > > > > > >   =A0 =A0=A0=A0=A0=A0 i3c_bus_normaluse_lock(dev->bus);
> > > > > > > -=A0=A0=A0 ret =3D i3c_dev_do_priv_xfers_locked(dev->desc, xf=
ers, nxfers);
> > > > > > > +=A0=A0=A0 ret =3D i3c_dev_do_priv_xfers_locked(dev->desc, xf=
ers, nxfers, mode);
> > > > > > >   =A0=A0=A0=A0=A0 i3c_bus_normaluse_unlock(dev->bus);
> > > > > > >   =A0 =A0=A0=A0=A0=A0 return ret;
> > > > > > >   =A0 }
> > > > > > > +EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers_mode);
> > > > > > > +
> > > > > > > +int i3c_device_do_priv_xfers(struct i3c_device *dev, struct =
i3c_priv_xfer *xfers, int nxfers)
> > > > > > > +{
> > > > > > > +=A0=A0=A0 return i3c_device_do_priv_xfers_mode(dev, xfers, n=
xfers, I3C_SDR);
> > > > > > > +}
> > > > > > >   =A0 EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers);
> > > > > > >   =A0 =A0 /**
> > > > > > > diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> > > > > > > index 433f6088b7cec..553edc9846ac0 100644
> > > > > > > --- a/drivers/i3c/internals.h
> > > > > > > +++ b/drivers/i3c/internals.h
> > > > > > > @@ -16,7 +16,7 @@ void i3c_bus_normaluse_unlock(struct i3c_bu=
s *bus);
> > > > > > >   =A0 int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev);
> > > > > > >   =A0 int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *d=
ev,
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 stru=
ct i3c_priv_xfer *xfers,
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers);
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers,=
 enum i3c_hdr_mode mode);
> > > > > > >   =A0 int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev=
);
> > > > > > >   =A0 int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev);
> > > > > > >   =A0 int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
> > > > > > > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > > > > > > index d5dc4180afbcf..67aaba0a38db2 100644
> > > > > > > --- a/drivers/i3c/master.c
> > > > > > > +++ b/drivers/i3c/master.c
> > > > > > > @@ -2945,7 +2945,7 @@ int i3c_dev_setdasa_locked(struct i3c_d=
ev_desc *dev)
> > > > > > >   =A0 =A0 int i3c_dev_do_priv_xfers_locked(struct i3c_dev_des=
c *dev,
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 stru=
ct i3c_priv_xfer *xfers,
> > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers)
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers,=
 enum i3c_hdr_mode mode)
> > > > > > >   =A0 {
> > > > > > >   =A0=A0=A0=A0=A0 struct i3c_master_controller *master;
> > > > > > >   =A0 @@ -2956,9 +2956,15 @@ int i3c_dev_do_priv_xfers_locked=
(struct i3c_dev_desc *dev,
> > > > > > >   =A0=A0=A0=A0=A0 if (!master || !xfers)
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
> > > > > > >   =A0 +=A0=A0=A0 if (master->ops->priv_xfers_mode)
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 return master->ops->priv_xfers_mode(de=
v, xfers, nxfers, mode);
> > > > > > > +
> > > > > > >   =A0=A0=A0=A0=A0 if (!master->ops->priv_xfers)
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENOTSUPP;
> > > > > > >   =A0 +=A0=A0=A0 if (mode !=3D I3C_SDR)
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
> > > > > > > +
> > > > > > >   =A0=A0=A0=A0=A0 return master->ops->priv_xfers(dev, xfers, =
nxfers);
> > > > > > >   =A0 }
> > > > > > >   =A0 diff --git a/include/linux/i3c/device.h b/include/linux=
/i3c/device.h
> > > > > > > index b674f64d0822e..7ce70d0967e27 100644
> > > > > > > --- a/include/linux/i3c/device.h
> > > > > > > +++ b/include/linux/i3c/device.h
> > > > > > > @@ -40,11 +40,13 @@ enum i3c_error_code {
> > > > > > >   =A0 =A0 /**
> > > > > > >   =A0=A0 * enum i3c_hdr_mode - HDR mode ids
> > > > > > > + * @I3C_SDR: SDR mode (NOT HDR mode)
> > > > > > >   =A0=A0 * @I3C_HDR_DDR: DDR mode
> > > > > > >   =A0=A0 * @I3C_HDR_TSP: TSP mode
> > > > > > >   =A0=A0 * @I3C_HDR_TSL: TSL mode
> > > > > > >   =A0=A0 */
> > > > > > >   =A0 enum i3c_hdr_mode {
> > > > > > > +=A0=A0=A0 I3C_SDR,
> > > > > > >   =A0=A0=A0=A0=A0 I3C_HDR_DDR,
> > > > > > >   =A0=A0=A0=A0=A0 I3C_HDR_TSP,
> > > > > > >   =A0=A0=A0=A0=A0 I3C_HDR_TSL,
> > > > > > > @@ -53,6 +55,7 @@ enum i3c_hdr_mode {
> > > > > > >   =A0 /**
> > > > > > >   =A0=A0 * struct i3c_priv_xfer - I3C SDR private transfer
> > > > > > >   =A0=A0 * @rnw: encodes the transfer direction. true for a r=
ead, false for a write
> > > > > > > + * @cmd: Read/Write command in HDR mode, read: 0x80 - 0xff, =
write: 0x00 - 0x7f
> > > > > > >   =A0=A0 * @len: transfer length in bytes of the transfer
> > > > > > >   =A0=A0 * @actual_len: actual length in bytes are transferre=
d by the controller
> > > > > > >   =A0=A0 * @data: input/output buffer
> > > > > > > @@ -61,7 +64,10 @@ enum i3c_hdr_mode {
> > > > > > >   =A0=A0 * @err: I3C error code
> > > > > > >   =A0=A0 */
> > > > > > >   =A0 struct i3c_priv_xfer {
> > > > > > > -=A0=A0=A0 u8 rnw;
> > > > > > > +=A0=A0=A0 union {
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 u8 rnw;
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 u8 cmd;
> > > > > > > +=A0=A0=A0 };
> > > > > > >   =A0=A0=A0=A0=A0 u16 len;
> > > > > > >   =A0=A0=A0=A0=A0 u16 actual_len;
> > > > > > >   =A0=A0=A0=A0=A0 union {
> > > > > > > @@ -301,6 +307,10 @@ int i3c_device_do_priv_xfers(struct i3c_=
device *dev,
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 stru=
ct i3c_priv_xfer *xfers,
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int =
nxfers);
> > > > > > >   =A0 +int i3c_device_do_priv_xfers_mode(struct i3c_device *d=
ev,
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i=
3c_priv_xfer *xfers,
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfe=
rs, enum i3c_hdr_mode mode);
> > > > > > > +
> > > > > > >   =A0 int i3c_device_do_setdasa(struct i3c_device *dev);
> > > > > > >   =A0 =A0 void i3c_device_get_info(const struct i3c_device *d=
ev, struct i3c_device_info *info);
> > > > > > > diff --git a/include/linux/i3c/master.h b/include/linux/i3c/m=
aster.h
> > > > > > > index 12d532b012c5a..352bd41139569 100644
> > > > > > > --- a/include/linux/i3c/master.h
> > > > > > > +++ b/include/linux/i3c/master.h
> > > > > > > @@ -472,6 +472,9 @@ struct i3c_master_controller_ops {
> > > > > > >   =A0=A0=A0=A0=A0 int (*priv_xfers)(struct i3c_dev_desc *dev,
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i3c_pr=
iv_xfer *xfers,
> > > > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers);
> > > > > > > +=A0=A0=A0 int (*priv_xfers_mode)(struct i3c_dev_desc *dev,
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struc=
t i3c_priv_xfer *xfers,
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int n=
xfers, enum i3c_hdr_mode mode);
> > > > > > >   =A0=A0=A0=A0=A0 int (*attach_i2c_dev)(struct i2c_dev_desc *=
dev);
> > > > > > >   =A0=A0=A0=A0=A0 void (*detach_i2c_dev)(struct i2c_dev_desc =
*dev);
> > > > > > >   =A0=A0=A0=A0=A0 int (*i2c_xfers)(struct i2c_dev_desc *dev,
> > > > > > >
> > > > > >
> > > > > >
> > > > >
> > >
>

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
