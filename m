Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED045CD8CB9
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Jun 2026 02:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iTGFarEz0/rtPdppjBv5aeF55rA39oI4LqP1RsItGpc=; b=wIsNgMmDpkk/FZ
	7LJ/cOOdI12hRYaylHh04E4Ao/6tZMPeLVbM0XnbklZPqb0qLG/3wcBbjigqIH3bD17dg+/zTWILJ
	w2FO9Ip7CoPE7it8rgrG+tfV23GR04YJKBKVOvwyUfP8tjdRK/hsmZBgA5A2mMslsP9oNThat7cvQ
	5J0Z5fQ7honQRk6rpbgDQ2qmkYs04bJkyyZDM5o+Igh7EMfo21DDVF9CHmZccS5t6AtvdNw92ZDZn
	FweeTLZt2dUSkdZMTRnQ5P2zHphv9/9zgd1Jyil16E4NyuPI0xuT6lzEY2t57XrYbgg9y9nMuvTRm
	FCkwtiXeg6KzENTfFoeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX8Mc-00000006gIo-2M7y;
	Wed, 10 Jun 2026 02:08:18 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX8Ma-00000006gIL-1kFT
	for linux-i3c@lists.infradead.org;
	Wed, 10 Jun 2026 02:08:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oW0RboL1W4uElJQ+yQ8ISIqJB8h+CJG7owEKcqDR8B0SHSAXEPHL6SuF4SXsUwIQNtlZKifmTVow8jnaARYe+2kVq+oc6wNWjtBMQcTzIVFIdZsjd0uyOxXDOdtiJwtBBl4wgVY8h1IppxlxHerZLY0SrsEmK0aLbN3Hj4XQY60uKFt0WuYpCBjC8FTQET1doVSuz0yNqMn2rhehXKSNj1x43GKQhKGo7r2gPeUqxNGqb74WaCZMAAzREwPfWsDKlOKEOr6x8rUep+h8/y/VwxWf6vNgx8rDRRSC3Lg4zSrFGW6fnA9aHMC2Z7fsF6uhzvyPrvBITUiaCc4KnifT2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JkQFzcw7E4+mk5nQiIx7wo92ekEiBs5kV+eq5f8pt+E=;
 b=nuTpQOtNVBTMx8sd8YOlqUhya9ZEuAqhjT2WPczuNtJukVL48EfpqEYxBY3mZu//JXtgjyojrsxq8RPrXwQ4fLsMLHP4ZO31kD2YCS1lhjwBsWAwZ2ly+yW5Bc9kOakVD2N7RbJHfGJ1L3+MmatNx2yQRjfzo/Ris5UbrPPK0stZPw58wn5aZ3d12lRBuzI8wwoSxS0Pgp53GR67zflRGnyj/ndDPJ4ZbUS19zq+1156AN4RhkXPSBz8S8m19Xr9UtvNs8GxWqOeJoM1HqROhUU/38HjsNm/v8o/BRVsH3YsuRVStF8Om6enmXb2lRu4TXhVQsCDqTmPOBpvgJqZsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JkQFzcw7E4+mk5nQiIx7wo92ekEiBs5kV+eq5f8pt+E=;
 b=lsRrMRV2upVH0I9qYIoB1YQnb17EecC07w/ZtdUeGJBRlIsYL3bWzfenKuoY2jM91oVfFa2rx1bgyRrikJ5yBguljsTcNo2ZsErByFFyiJ9NPBjcJbivxeV6b7Klj8e8qyFy1N9jCbi6v54YvGx4Erfe+ce93RW4iaP0vKnQsyaZfA0s+4u2QTdRCqHqO+mup2KVd8zta2nFV8u7WXUn6Hg/slh+83tJ2Wts3Yq8gYx2gBOcWWu7hGR8HD0YY0f5+kRlo16lVKzPbEPjHCHTIPx+xoPptU0mjRe+ThBSDK4nuQG6FXmt/yvb22o/qBVHTuHYXJNFmyc3fyapEoPBQw==
Received: from SJ0PR03MB5951.namprd03.prod.outlook.com (2603:10b6:a03:2de::13)
 by PH0PR03MB7158.namprd03.prod.outlook.com (2603:10b6:510:29a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 02:08:06 +0000
Received: from SJ0PR03MB5951.namprd03.prod.outlook.com
 ([fe80::f285:8376:68af:6acf]) by SJ0PR03MB5951.namprd03.prod.outlook.com
 ([fe80::f285:8376:68af:6acf%5]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 02:08:05 +0000
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
To: "Frank.Li@kernel.org" <Frank.Li@kernel.org>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.li@nxp.com>, "NG,
 ADRIAN HO YIN" <adrian.ho.yin.ng@altera.com>, Felix Gu <ustc.gu@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Manikanta Guntupalli
	<manikanta.guntupalli@amd.com>, Jorge Marques <jorge.marques@analog.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] i3c: master: Validate GET CCC payload length and
 retry M0/M2 once
Thread-Topic: [PATCH v2 3/3] i3c: master: Validate GET CCC payload length and
 retry M0/M2 once
Thread-Index: AQHc9/lGs1ArEJV0/0ao0CFA6bDSmrY2BgmAgAEF9QA=
Date: Wed, 10 Jun 2026 02:08:05 +0000
Message-ID: <101697c2-64fd-499b-98e0-9e65eb219810@altera.com>
References: <352ed29363b12d1d145ffd44316564bd8e33444c.1780999511.git.tze.yee.ng@altera.com>
 <20260609103029.994891F00893@smtp.kernel.org>
In-Reply-To: <20260609103029.994891F00893@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5951:EE_|PH0PR03MB7158:EE_
x-ms-office365-filtering-correlation-id: 3a5fb857-893e-4f01-f462-08dec6951c3b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|921020|55112099003|11063799006|4143699003|56012099006|38070700021|6133799003|18002099003|22082099003;
x-microsoft-antispam-message-info: ZNlOiN3Xjj/gRlKCb5ifEQ8GXSTT4dg/PSs2AgZvbaxNouFXKIU9sbmmBFyR5mu3RD1w92MqYLf1Ub5hiOsdUNz5M/kkvW5Ed3EbQR+EkZlhBNH49R7HB9264OS19qC9Ez3bnVTGxajkinL1Wzfrrxkc+7fxB/S+lZaGT9x27OpdmxX03ljFBhWz4/5o6LvDv7jZJNBtrEmCmqOzLhewAeBiw1wSnPW/C5toiKTV0cRcNQBlDHrnHmWSG3TQ8fG8qz47UIE1B3NVXRGWOoXci1ZS9cFsZa7fIm3hYIG2dWgS9Jtqdg4mC3t559tPEELPIMrgFiwE/4wfe0zuedVYzAETwm4b3Y84h3sblnoOQuRe3QTvqOH2T3XQtoO5I94mXMS0otFAf2iEvckC5fHxWRxU9siVYK7ps4VEIbRtHVLhyPtw4+2whvb8tZr44s1gt4feUcqtxxN8SsRvx08NRjq2lT9vCCkFSkAW91vto4dvbwC95QmpCqyL7DefmDGqaKnjV9tfqJSAx/w1pPQaXgr3w7wsadsMnLGkCAWKyxKXdwcQSkFO+41lbfPMdUb7G1wY4QIqT7AcmAbl23AeB/ukzlmrllcfrLtbI+CDTmpQYJ/YAm7P2fKbvsigj4RnB0xNxMOR0zy/R+GO9jb+/3WmIEZHbALaoXYJyuUnUcnWgUB2lNotjmv6pQY/RF6LKnHywI6FiQ2PNMAMuUiXpON/aRSG2MbIp4SBgT3n2c38INJjky21y62W9SRYIMd7l7FSZPlbCOUVlSoHbHxrvg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5951.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(921020)(55112099003)(11063799006)(4143699003)(56012099006)(38070700021)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGJxMGZqazBERGJ0Z2grSGMvMFhVbWFTOHZGTDF5UHJxbXNqZWQrdit3ZnAy?=
 =?utf-8?B?MDNDeUpoQWVrTnZRZytLWTVackpEYjVQNHd2TkJEVUtxT3ZzZjZwNUhqSXpz?=
 =?utf-8?B?SjNlWTF4bUNOamdNTUlSTk56MU1KUEg1U2lvQkFpUVpKaEQrT2FNMk00S0Jn?=
 =?utf-8?B?czNzeFRBaE5JU294bjROQm44TEtNcnFxbldBTndlbWZ2eFhIcXQ3NVVyV1pY?=
 =?utf-8?B?czUwMjY3WnNNRk9PbGJRUE4wSHRyQ2JtWU5TWjBBT0EzTmZUTXczQ0lreDUx?=
 =?utf-8?B?NHlUVXlTRm1pWjZnNHJ5akh6Zkg5NlhRQTV6QzQ0YjR2MFpXSEo1RnVDRm9q?=
 =?utf-8?B?ZUFLQUlxYUh5TGozN2ROZDBOZk1Id00yWDhwOEd5RnQ1am9kQ3NEbDF3KytG?=
 =?utf-8?B?d1Z0MmEzdWtWRVdQTWVIRXpKL3BzeW5scHJLNktSQ2hEV0dyT1I4QmlKTVBQ?=
 =?utf-8?B?SHRRYlUxTjlnZGw1TXN2VlJDblFrajIzaEVyRm9lcE5mVnNmY2FIZjZCU2wv?=
 =?utf-8?B?U2MwdWdrSkd1MDNyeTJNQ01xRVdSOVhwd2F2ZEtaeVdadi81Nys4c0dFRUNY?=
 =?utf-8?B?b3J2dFdMZTdSR2l2YkJLQnc4VzlJUnRKYUpyV042V1V5bGJQcEttZHZIbFk3?=
 =?utf-8?B?S1BYd1M0RmVWTmJrODkxVkhLbnBhNjExeWtrdG4wYk13Vm9oSDVHd1dhUEEy?=
 =?utf-8?B?d1RiV2hZR2lKSVVaTjVYUjdsdWJKZGJjbmRoN0lBaFhQTDVJM3JOdjNiQXp2?=
 =?utf-8?B?TlJJY3dhcjk4UHdzUkhhZEtFd0ZLTFhtRjBXUnp3SFVadW9ZUjJLTHhGbVVa?=
 =?utf-8?B?SHRHM2V2QXB6LzdodzhNeHBEVi9HU0Q5U0dKbzhLV1hnby9HeXdOSGhFT01G?=
 =?utf-8?B?Y0dhcW1XT2xUUFVHeC9EbFZwbWRza3ljbjQvN1N5ZFVSWWp2Z2NBUlNFS3dR?=
 =?utf-8?B?cWFENFZEQVBIZjEwVXJRQ1NmL1RydjIrTGNHaEN1eEY0TFdpNmpKbUtKcjVa?=
 =?utf-8?B?TFluS1M3MzhlVXgzaUFtd29YcWVRS0M4U0o4N21vTm16bnYvUGt4aDYwQUN1?=
 =?utf-8?B?dW9hYVpSOXRBb2ZPdTlOMko1U3B3WW1RSktVS3JFK1JWNlhnenAzZWlHeUNm?=
 =?utf-8?B?akl4OW5pY0QvY0Nob1Y2d1VwRTdDTEdPV2VsQXJNeFhESE9xeVZ2TzJoTXRj?=
 =?utf-8?B?M080eEhlRFdjSXkxWHZ6cHRlajRJR3AvK29MR204aW4xSEVuWkh3b2F5UUVu?=
 =?utf-8?B?cThhWDhnRzY4RWd1WVMrRzcxRG01WVdHRXFxOEhvTnI2YU9BVzVjL0dvWTk0?=
 =?utf-8?B?V0ZMUTRoZXowUVlIRkhITkxqRTFjaVhxT3F6c0pnNTFvOUxvZkttanNjTHd0?=
 =?utf-8?B?THc1KzU2WFh1NUxNSlZ5MDQxNjE0ZzAvSVh2TS9TajhMcCtGamd2T2MyVFBJ?=
 =?utf-8?B?b3lCY1JkMHZLc2RBZDgvVUE2VDd3TzVSclF3Zzd4MVU5WTZmdGxLMFY4SnFV?=
 =?utf-8?B?dFRvc0h2MUFMTXRpZSsvT1Y3RmlGMTQvNmdKSWtqYWpVSTFNN0RpUENXaHVV?=
 =?utf-8?B?WElPNHpZaklLRUd3K1FyM21EUm5FaXhOczg5SC83S3ZRNXE2dzNuYk1CR0FN?=
 =?utf-8?B?UFVPR3JVb3RzQTNXMElRTW55NFkzRUhhZUhvSW5VV0pPbEkyeEZBdVcvTXRp?=
 =?utf-8?B?NFU2b2pIUFZCSWI1SnMwZVM4M1ZKN2RWNVhsaUpTVGg0dVVhOFh5WTF4Nkcz?=
 =?utf-8?B?bzdTUklvQjZ2U3dpSXk1YmZhUHlxNWdyLy9NU0JIMjNydzdqNlQxM2xIbFNH?=
 =?utf-8?B?ZHJRMkFMb2dYNjg0OXo2R0JEVXJoMW0xaVQzM2ZpcFBUb3k4elBmaVA5d2RK?=
 =?utf-8?B?NnRPemhlM1dScDRTbU85Rlk0d3FoRDliNEVrUEtpTTV1MllSSzFnRjdKT0Qw?=
 =?utf-8?B?MTF6bEhJSitHekh3eEFtd24wS2JBbmZ4UGgxUHVGMFNrbkhNSG5qVG9nVEpL?=
 =?utf-8?B?eTBDcUpVRTBoVTNHeitpWU12dWxtSnlzQzJyR0ZETEtERk95MS9tNmoweVBJ?=
 =?utf-8?B?MFBzOGJiZmwwa2tPbit0S01IU2xlWm1KclMvME82MkpWdFl1ODdhVVdzQkFn?=
 =?utf-8?B?VGJ4R3hIM1AxUG56NE1CZGxyWjRZSFREY3MzSWNleTAvMmlwaE55N2hFWTIy?=
 =?utf-8?B?c0kyTmEwTFhXQU8vbWNRU0c5NnZyRExOUkRzbUhmWGI4TFBJVExiVEtvVXhj?=
 =?utf-8?B?d1V6U1VDZGJQclA3OUJuOEFaNUx3NmsrMW9ocXlMcEN3VUcvU0FuRWtxNXhQ?=
 =?utf-8?B?cEJPeWtCR3hNRW9naFJXckdGU0xRSURkTmtpQWVpcGtKQUdrMHVkU1p2Mjc0?=
 =?utf-8?Q?PJxibB5wRLG197Rg=3D?=
Content-ID: <13BA13E6A5D19D488B606C456C3FC88E@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5951.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a5fb857-893e-4f01-f462-08dec6951c3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2026 02:08:05.8701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ruNHk+thw8qSO0GTuz6ISMv4SJ85gQKK4dTlhNVKDoZQNpK9n8x8jkNFo7Vh9Wu5BDFjY1DZApN3Jy9whRfoUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB7158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_190816_479235_86FEE197 
X-CRM114-Status: GOOD (  14.71  )
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

On 9/6/2026 6:30 pm, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Address NACKs are incorrectly mapped to -EINVAL instead of a hardware error code (-EIO or -ENXIO), breaking standard subsystem error reporting conventions for standard transfers.
> --
> 
> commit f0f1354839be36f55ac51ec9d8d9c182653a6497
> Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> 
> i3c: master: Validate GET CCC payload length and retry M0/M2 once
> 
> Validate GET CCC payload length after a successful transfer. Treat a
> short read as I3C_ERROR_M0 and return -EIO. Retry GET CCCs once on
> retriable errors.
> 
> [ ... ]
>> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
>> index c4004f87c6857..a8b5ebabd3508 100644
>> --- a/drivers/i3c/master/dw-i3c-master.c
>> +++ b/drivers/i3c/master/dw-i3c-master.c
>> @@ -493,7 +493,6 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
>>   			break;
>>   		case RESPONSE_ERROR_PARITY:
>>   		case RESPONSE_ERROR_IBA_NACK:
>> -		case RESPONSE_ERROR_ADDRESS_NACK:
>>   		case RESPONSE_ERROR_TRANSF_ABORT:
>>   		case RESPONSE_ERROR_CRC:
>>   		case RESPONSE_ERROR_FRAME:
>> @@ -503,6 +502,7 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
>>   			ret = -ENOSPC;
>>   			break;
>>   		case RESPONSE_ERROR_I2C_W_NACK_ERR:
>> +		case RESPONSE_ERROR_ADDRESS_NACK:
>>   		default:
>>   			ret = -EINVAL;
>>   			break;
> 
> [Severity: High]
> Does moving RESPONSE_ERROR_ADDRESS_NACK to the default case incorrectly map
> address NACKs to -EINVAL instead of a hardware error code like -EIO or
> -ENXIO?
> 
> This function serves as the generic completion handler for all transfers,
> including standard I3C and I2C private reads and writes. An address NACK
> usually indicates an absent, disconnected, or busy device.
> 
> Returning -EINVAL for a hardware NACK during a data transfer diverges from
> subsystem conventions. Can this cause userspace tools like i2cdetect or
> core probing logic to misinterpret an absent device as a fatal invalid
> parameter error, rather than allowing graceful fallbacks?
> 
I will submit v3 to move RESPONSE_ERROR_ADDRESS_NACK to return -EIO 
(alongside IBA_NACK) in patch 2/3 and drop the accidental revert in 
patch 3/3.

Regards,
Tze Yee
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
