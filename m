Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0D1C55167
	for <linux-i3c@archiver.kernel.org>; Fri, 31 Jul 2026 06:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=um3GQeVtuyIAAfZE6qGfUpEc8Br2lN34SZ+5cZJYKWo=; b=bhaSvzhncvxTOb
	kx9XYGt+AhrRlRy2D5D06wI98whE5f3R36xFgXqpM5Tr7d/JMsufaIOZr5qFKOrLatfPf2mLoJO8Y
	F5REbbeqkACh7Uu8opcsxuN7o0CshkOrlkjaziIglKkrmA0YJtYZeamIo81rpkUpdhFg3uxJcAiEs
	oSKOFsiKqSQ/pk3sICrH+WQyBs3Po2VywnYrBhHXXinnxrvf4bwz7DWAVjCSdQVOrWpoQuB9QztEj
	W29xDV6L9ZfmVZiq0jojvmOMtmn6HXXQFlG1vg4NWKB11H0/7e39W5olSipn12xrkus9YxzMLgT4A
	cUiu8cGhCvPjvJRvmaqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgLV-0000000Briu-3Xvl;
	Fri, 31 Jul 2026 06:03:49 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgLS-0000000BriT-3hCl
	for linux-i3c@lists.infradead.org;
	Fri, 31 Jul 2026 06:03:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzHWHWoXCGlya3JNHiO7DCNjkLSILXxwhWmHEDUh/gidiexT6sMlwpXt6JJC8EK1Zyv5OADfDWKl90Q1VzzmHPIiC4PA8GDq41baBf/3io4eMwtDMdVq5ZZjIMpkNyXKAX1OQ2hqbVxD3yK0iVn/NWXPOPuHrTfZdZdDzh+7QgCJSFfJQo11nZT+A+IFpbpS4Ms3NRczQP0UwCKnCvgkplMacB9H3IBcAWZtfdLvG69VTvlVReYv/IOJimXhXT63nwM7ECLSYhSABDwLiHYcs35Jl//az11IuZaDhq+s+yDfjO6eGyD7DG88kGWQOJGHYwkdwurjoMprBLYzqO76LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjF93ENOxdySS9lzQv3hV2bXf62zmB17gKKQzNmyp9w=;
 b=KkxouzZSD5X+ZvRJjV/KaiIZ4QCeDRtkubVAH6teRyjN1BK9ztLmxg9cUN2mPMNWvnnshJtq/VQUcOpCRl9Il7/X0s25FMnz1/EvHF4ZfKhSiFf/dCkWdDEjr3Gn316PrC9HT+h863n7SxRxOaeg8S8RTKOpsBNc/abhCF7+k7MleNEyslpg5WFD7u4vXhEFFQSmy/XMbmW1cUHQLU9q6sNpOMhDuOmkFAqQjeo0igE+w5ITSFll7ycH3kIddfHNBZ/bvMecE12CH2QfOBEI826WRp3mepmnreNYpPNWMIrH2R7VhbAp7KOWCWlJdpZdbUxM6dioloGnC+KFyfncMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjF93ENOxdySS9lzQv3hV2bXf62zmB17gKKQzNmyp9w=;
 b=Du5mfGdYp4VO5lBUEfWlcThgFk03v7Y62aO09qH2CSKEqorea3d404ssEI+4D1VMazm5kzWC5NGcE/Udd4NSws9RAzaWWhy6ky/u1B5J0ytfV5esAr7OUWSqgQo3C+I74WI/DQZudomstQIWJ4lvffHGVVjPjCxMKNB/fHk1eJfcgZ8etQ1g/oz/YLtSnUb1UYsDeqqOBjI1EVvdIcHA8rWak3kr9s059s8yM1atRmes9MrgxX0lJtJrEJFm5OZXMJElAzdlnrFY8no/7Ntt4cOhX0dMf9g2XCrmoaD5fxwT5956rhx0PdaMJbJ8pYLsThXs23392ET/A+ZgZq/+hg==
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by CY2PR03MB795773.namprd03.prod.outlook.com (2603:10b6:930:117::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 06:03:40 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 06:03:40 +0000
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, "NG, ADRIAN HO YIN" <adrian.ho.yin.ng@altera.com>, Felix
 Gu <ustc.gu@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, Akhil R
	<akhilrajeev@nvidia.com>, Manikanta Guntupalli
	<manikanta.guntupalli@amd.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] i3c: master: dw-i3c-master: fix OD timing for first
 broadcast
Thread-Topic: [PATCH v4] i3c: master: dw-i3c-master: fix OD timing for first
 broadcast
Thread-Index: AQHdIKRJ6IV8m2dRnE6yGVSwdIjJmLaHCq6AgAAYsQA=
Date: Fri, 31 Jul 2026 06:03:40 +0000
Message-ID: <1c4897fb-45ad-41e7-8aba-ccc9b2781cbb@altera.com>
References: <c2d80c4fabd36aa00dc1fc507ff20211bba10c3f.1785471627.git.tze.yee.ng@altera.com>
 <20260731043516.5CD251F000E9@smtp.kernel.org>
In-Reply-To: <20260731043516.5CD251F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5950:EE_|CY2PR03MB795773:EE_
x-ms-office365-filtering-correlation-id: bfd2ac8a-b63d-4e1e-1b68-08deeec97819
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|921020|38070700021|6133799003|56012099006|11063799006|4143699003|10067099003|55112099003|18002099003|22082099003;
x-microsoft-antispam-message-info: n3givj/epLYlc1IRmbjVqKSghGNuwOazIoo9dFBjsCbpiVcsKmgYP6bpHUefpoDZDM2rKswUrxvtjPGJz/EaOTMUC2xTmJG8RQA6UZpU4i6Eye2us2Kp3NA3NAjmpfNCPK1/xz9/7kplBQjkX27Wwug0ITvQNBnqQZm8P4PPtfSyZDWtM/Ir5K8OngTYyrhct0Ee+9nJLbZkIEnf1bVJl80cMEdEHh4GOvAqxEAaqVvBXw7Lz03ISzomNTljuiLuQhA9FAk/Gca9dB/BIU8ZrB8ZASurpjFDcuNhs1F0dJmu9lENpOKdzTdL2Plmt7SiP8RdUkjecWUw3oMFHwFo3SlNFtr4zToiteiky8su7wyRdlOFSMuwl2PjcTOMBboFlg7j51D1oUiPGf6iyZeFs/FE+3KP0/t7A14nsXhHQToA39EEtkkvSpJ/RqcxiFwLuFlAtfCE87ZEuivMc/yNQmmfTR98+8bSGbptIFcTxErFSCNwyOD2dnpiL44H/ul/9VBQ6AbDOr6vs3bMyIdSlJm9dZ4kwPJGH6bo6mfyclpTKYD20b7KXSsTXCFNq5ZtwwuAXs5xZDdakxS7SBDlJi0ify122UeFtQGHAZdTg0HwQLJOI5sZde4OHupsEc2C9dnTBTtDx4Stp3ZLKEhtP136P9iv1pw9L9NhZIxWaGw3UzFGvHdb/TLWYui0JSgZQazQunE0pcuI1BoRi9M9h2LqtlIHeAR1zrlRfw1G+ROIcNxHNLsV9Frl+knl27TB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(921020)(38070700021)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003)(55112099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vjhvd2tXZjBiUEZZczJMN0p0OFpsT282UUZtRDZkV01obTNZSis1bGlMS2Zz?=
 =?utf-8?B?N2huTVkyN0kraUpkYVplUi9nWlk4WEVMamZNSnFtL3N2Z0M1bVUxakVrT0oy?=
 =?utf-8?B?S3RQZHlkTGVmcCtvZXgyWm9hNFFDMW5hRHBhWWR2Nlc0OG0wY05tM2JVZ2NU?=
 =?utf-8?B?UlNvdXVyekhRdWdyMEtxTkhLalkrdlJsTERxTXB0RDJaaXYvNnp0MktCWjYx?=
 =?utf-8?B?ZUdXOFU3V292M3ZGTmdCTFUvdEc0TCtPYnBYT1lsNTdHL0FiQlVlNzd5SXlT?=
 =?utf-8?B?V0JXUCtxaUs4Qy9NWDRpYzltbmxyMVNVdG1jYzRtMTRicE9IMkJQV0I5U0xw?=
 =?utf-8?B?aG54ME9VQWc4ZHJOVDJOMjc3Uk9FMVpYdENHSnI4Z0djeTViYkU5WE1IV0hY?=
 =?utf-8?B?eFA1MUd1U0ZwN0dUekw4Uk5TbngrYnZSdkg2MEFSWFR2eFpXQUViMnJmU2V0?=
 =?utf-8?B?bENqcEsyM2dCaWl6aWR4Z2dyZzVOdkM1OFdpWVI3NitsMUdmQllWcE5ka2dt?=
 =?utf-8?B?d3RnVlBUbU54SUtBanFTSUxNVEdHRkZtdDhrcDdvWG9ySW5iK2hBdExqTVRw?=
 =?utf-8?B?T1RUUzh3MWNCMndyeTg5TWo2Ylo3ZWNNYUhOM2gxa0NxWk84RmlkT2EyRmNu?=
 =?utf-8?B?dGNRMkt4VjJtcWFNa2RVWi9yMUsxVk5Sa0ErUmZYVlBvcGFFSUR4YkpOcElK?=
 =?utf-8?B?M3JTSHlkSFV4YTRIY3c5VjlPdkZuU3FVUlU0K3NubW0xbTdZSUlRNk9QNGU4?=
 =?utf-8?B?TUt2dlZGZDNMWHpkZjNYcjJQME9lVnRjTm55R3VSbUhXZnEwSEtrYVMwaG5B?=
 =?utf-8?B?TlA5WnE0OUtCTFJwQU1iYkZvMFlFK3ZWSzBuV3diUUsxTmNLbFNxSHFLeDZ4?=
 =?utf-8?B?MVJ4TmR5R1ZWSXZrL1lpQ20weWplV3pRM2FHSlAvTW9pNk1Qd3o5UWpWNDhk?=
 =?utf-8?B?TXV0N3lPbUYvRnBVdXl4YVZsUGx2ZVhMRE10a0RqVk5VMHlUbFBGSXc2bVZS?=
 =?utf-8?B?amtDOFptZ1ZZa25LZWRWRC8vU2VpN0pWMmZkTUFlUHZUTml3czV2NWFFbjB5?=
 =?utf-8?B?eW5lVWVOTVN6a01na1A2eVl2UFRTQkkvS1hLNndIZXZWY0NPQy9WWnUzclJZ?=
 =?utf-8?B?RnVZelg2TnMwYitlc21vWHJvWU4yRys1TXFaVHhMUDhyQnFtaDk2QzlDZlhX?=
 =?utf-8?B?V0hrL0dnUk5rU1RVZGdpMkk4dk52WUVjTlV2NnlnekFxaXdOTVdrbkQ0U3lT?=
 =?utf-8?B?dzMyL2FiNks0dzMwMFFYY1djWFloZmRxTGhTVGpHd2k5M29vaE9rNktraFBv?=
 =?utf-8?B?aGZ4TlkxUTRBR3BqZnZmSjRPZEMzZnFpV0hweDlJWitGS0M3cyt6Z0cyTTJt?=
 =?utf-8?B?T2dseGdPb3MyNDhpcXczbFBGOWVnQmV3SVI1TnN5azVDNnhoZDFEeklQLy9v?=
 =?utf-8?B?WUErWVVheVF0c3g4M0xrbW5IbzBUVFZjb1ROS3NaaENHZjQzWXJoSUFZS00x?=
 =?utf-8?B?WjZpd3dOYThBcU44L1hJSE9CVXVweDRvSXp1NE03dHJRKzBrZkRFUzI4eDR6?=
 =?utf-8?B?MkJSZVdyTStyeklTd1JsYjJZV3RmbGVzM1RNOHFOeTJhcDRUNG9XdHRwRWxL?=
 =?utf-8?B?NkxHVnNpdDNQVElYT0s0TE9lNnBHRTdUR1g1RDc2QlphUTJaQytqYkhzU1VB?=
 =?utf-8?B?MEtULzVVMHBRWnpOZHc3R2NuQkxpb2VrRHkyZDhZTm1IQnhaekJ4OEFIYUkx?=
 =?utf-8?B?VVJoOXpWZU9lajlaNkZydjJ2V0ppWW9maHl1SnBBR25CQ2lsUE9CbkVZSDhX?=
 =?utf-8?B?MTU3a2J4YlNqcFNzbmJVTXp0N1I0bnhjM3hPbnhmOFEyNjdlOUVJcUZ0dWdN?=
 =?utf-8?B?YmxxZGdsYWh5ZGNERzlhL0tHR0tKUHVsYmY1bUttTGlwT2RROHdFT3lZY1dY?=
 =?utf-8?B?VXkwa2phR1p5dlhKT1dFZ2YreVBXK1VQZVJuNVBtTVAzd1hBZEVKSFkyMTBy?=
 =?utf-8?B?LzFEWURaSHRXczR6elNFYjBhT0lON1pzUThyemRKMnZmSU04YnQrOFRrS1lV?=
 =?utf-8?B?UnhjQmQ5SDhRZTF5bFkwWEQyUHA1NjZka05uaWJkTitUT01wT2dTQ0pFZXpW?=
 =?utf-8?B?QkVmaFdwN0RwSmxjZEx0QWVZSDFocTREb0hBTlU3TlgxakhKaGNhMVpOUjFQ?=
 =?utf-8?B?L2I0em1iRlV5cG4wa1NtOVhwc3NPbEJzSFcxOVZIOEM4MVQ3T3hHZkFiVlJE?=
 =?utf-8?B?M095WDFtQ1pKQUc3dUI2bklMNVE3N1ZwTklFeW9QSTdIMHFjNTJmY3lOV05p?=
 =?utf-8?B?UEN2Vkc3WnVkUnNGbXJkYWllTkFjR3hlSDBaSVhES1hZMnNldFhtZz09?=
Content-ID: <7C31A8C12D351941BE7ABDCB17F4D712@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd2ac8a-b63d-4e1e-1b68-08deeec97819
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2026 06:03:40.3817
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mjIJlCy7OCtBJhHlQ+k0lixsaeA841ROZR1dL3qXLNj3IPxrx5DjOI+4xWLq8YZZW6HCW/127WG9W81cGtGWNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY2PR03MB795773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_230346_939956_03391F88 
X-CRM114-Status: GOOD (  19.98  )
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

On 31/7/2026 12:35 pm, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Initialization failure on ACPI/DT platforms due to missing core clock fallback in dw_i3c_master_set_speed().
> --
> 
> --- Patch [1]: [PATCH v4] i3c: master: dw-i3c-master: fix OD timing for first broadcast ---
> commit c4596518222ed00cb6c15e2963a846694b7f5d55
> Author: Tze Yee Ng <tze.yee.ng@altera.com>
> 
> i3c: master: dw-i3c-master: fix OD timing for first broadcast
> 
> This commit implements the ->set_speed() callback to allow the I3C core to
> switch open-drain timings for the first broadcast address. It caches the
> normal OD register value during bus initialization and computes a separate
> od_hcnt for the slow path.
> 
>> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
>> index 3816a50a52cc5..11ae517cf2e60 100644
>> --- a/drivers/i3c/master/dw-i3c-master.c
>> +++ b/drivers/i3c/master/dw-i3c-master.c
> 
> [ ... ]
> 
>> @@ -1531,6 +1537,50 @@ static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
>>   	return IRQ_HANDLED;
>>   }
>>   
>> +static int dw_i3c_master_set_speed(struct i3c_master_controller *m,
>> +				   enum i3c_open_drain_speed speed)
>> +{
>> +	struct dw_i3c_master *master = to_dw_i3c_master(m);
>> +	unsigned long core_rate;
>> +	u32 scl_timing, od_hcnt;
>> +	u8 lcnt;
>> +
>> +	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(master->dev, pm);
>> +	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
>> +		return -ENXIO;
>> +
>> +	switch (speed) {
>> +	case I3C_OPEN_DRAIN_SLOW_SPEED:
>> +		core_rate = clk_get_rate(master->core_clk);
>> +		if (!core_rate)
>> +			return -EINVAL;
> 
> [Severity: High]
> Will this cause platforms without a core clock provider to fail here?
> 
> The rest of the driver uses dw_i3c_master_get_core_rate() to fall back to
> the "clock-frequency" device property if master->core_clk is NULL (such as
> on ACPI/DT platforms). If clk_get_rate() is called directly here on those
> platforms, it appears core_rate will be 0 and the callback will abort with
> -EINVAL.
> 

Agreed. I will switch set_speed() to use dw_i3c_master_get_core_rate() 
like the rest of the driver.

Thanks,
Tze Yee

>> +
>> +		lcnt = SCL_I3C_TIMING_LCNT(master->i3c_od_timing_normal);
>> +		od_hcnt = DIV_ROUND_UP_ULL((u64)I3C_BUS_THIGH_INIT_OD_MIN_NS *
>> +					  core_rate, NSEC_PER_SEC) - 1;
> 
> [ ... ]
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
