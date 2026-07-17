Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98291C4450A
	for <linux-i3c@archiver.kernel.org>; Fri, 17 Jul 2026 03:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HULC98Sk6xNAt3WYQ9Qlf55OJRYerE4jLo9zOvRYeWE=; b=tt/8AOTq+zEpIq
	vlGKMYPQVq5l4FqIJmeoHYe3faAgAzUQnPCZ8fxHm23QLeDg1xX3Ujn9yXBV+finZf7Cyk+B4B3zf
	PCSbb2dtNcZTO5VNHtAwwJanNZDxepmeVdNE4ZMILjflMfmTxrhq0bwMDDPehGkBmjHzmvL4Ueflo
	xkGO/LxFeTPdPmWyeKRpDYKyzKGno0i1mrWgRX1o3poSrgIfAEoc3f/iGT3wAyMrRrxJlRGwtJn73
	F+jyI/EhlNFNmz0okZxQMTnhjHUtqp+DOhpryaXuF5Xh087I3UIhiZGmzkPOJij0hmFCC2+CBk5yI
	zpp7Sp/9aHMtYJSfHraQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkYro-000000010gp-07QS;
	Fri, 17 Jul 2026 03:04:00 +0000
Received: from mail-centralusazon11011020.outbound.protection.outlook.com ([52.101.62.20] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkYrl-000000010gF-0hKQ
	for linux-i3c@lists.infradead.org;
	Fri, 17 Jul 2026 03:03:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t9Js1sYW1U5gjmc4WMI8CrQP6NCGRNJcXbf3GoembcKGq8HR4I08z+eifWlOu+TnjiGXFE76fDyCJ1UL+LisWSoEADAq1WQYk1y2tlpJXi8XKWqE9zslFLwbZFynSBDZ1wjBZgJkO1sCymjVmi3HmLpzmoTb6wVr/4J9vzu1woxZwENW+I4kFjvpl6ESQ8NMkg5EVFP3pZhUW1uuCYzYuke1asODZNznfieivAh1lxxWAEUX6OCIdDLvMOfXyCfR5YQ/0jOwfPVTqsjZ2DVcivkMNkR6nLZMwzxx7E1/KUxzy/8mudxZelKqxlxHLxIKCXlVgliVhHfBfsVH3xWKdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+viRCUzdXT+v2nxFJaQ/TmdZSYI6bbO+0h+DGNwkfXA=;
 b=tu7psJ6vJaFAWhbsX2/wRZDNiez5NnRkmQTtyGAoHPPnrCnp6ONa+Ykg1pBipJ+CkWcIuNFOwPNxj5niuGXkhMYFuoNKj5KdK+pu11NDsiDhO3+Gfzr27nuU6huov36ncOmr70VZ63dEfAfTva/JtjSdJDX14aWfZXXQP48zeNXwCqjpjv2OShm5FPLt7Q/R3Qjdqx/kff1b29rMRU9Cdusn3zlaX5idK1FDcLWZpsgyz1AbWJy5T1TjkTnX5wo0Cupj2UVqJ5DNd07lcHJV4C+99nRmNnUK1JOGwCw7zG7JJEgonOzfbIZqCRXdjOyK4eugMcDRPr3o4FLKFeKKmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+viRCUzdXT+v2nxFJaQ/TmdZSYI6bbO+0h+DGNwkfXA=;
 b=QiDV8Chq/CcN/gTrEbyc3wiDmTsS94fJZrm31l2wkH6uBy5lKoYOxwNM7exu9cgH1AwmyNTqOrDzZBsbgjzbEHLrBPw8xzl+E9RhchOimnfDJKFSm/E1GuMLl3qIlK5RppwCQd62vU3IdMC01Uyoc9iopTLPUeZT5QIC2LqJULxQ+n6GLWn7v4t9V8Ha1iS52uziIGIZGvaqNHUcsyAAgr/m0SZllX1Hy/DjzUx1IuOsFrSsQpKSLlwdJgfdNSlIAdqupWmC5QFVQ6svrucH5o0XckaEO8H7K/MnvCo0epdm1xnm4LjoOnvdhN1W8FLXRlJ/j06sLMQ01rH/WjEjpQ==
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by IA3PR03MB7617.namprd03.prod.outlook.com (2603:10b6:208:507::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 03:03:50 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 03:03:50 +0000
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
To: "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>, "Guntupalli,
 Manikanta" <manikanta.guntupalli@amd.com>, "S-k, Shyam-sundar"
	<Shyam-sundar.S-k@amd.com>, "Goud, Srinivas" <srinivas.goud@amd.com>
CC: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"Frank.Li@kernel.org" <Frank.Li@kernel.org>, Frank Li <Frank.li@oss.nxp.com>
Subject: Re: RE: RE: RE: [PATCH] i3c: master: dw-i3c-master: fix OD timing for
 first broadcast
Thread-Topic: RE: RE: RE: [PATCH] i3c: master: dw-i3c-master: fix OD timing
 for first broadcast
Thread-Index: AQHc+LEozGDrj02IiUO6j7w7qF/viLY3dzOAgAIUOgCAAQW1gIALBfEAgAfBbACACu/yAIAAN9mAgAxqhYCAACZ6AIAAAqgAgAwsdQA=
Date: Fri, 17 Jul 2026 03:03:50 +0000
Message-ID: <53195600-12a9-43ee-b120-0933dec90658@altera.com>
References: <ebddb8b62eae92de0a7eeda93cb18213c677ae96.1781077653.git.tze.yee.ng@altera.com>
 <20260610083656.334CA1F00893@smtp.kernel.org>
 <airgnoB0Uh60mn8T@lizhi-Precision-Tower-5810>
 <ccf5721d-3193-4a2d-b1df-23e1c648eda3@altera.com>
 <48947d4c-32a7-4f60-b5bd-c0881e76831c@altera.com>
 <CY8PR12MB76110BF12DB1557B0DBEC0F78CED2@CY8PR12MB7611.namprd12.prod.outlook.com>
 <7e432dc6-fe48-44c7-8a04-f80eb7d56673@altera.com>
 <CY8PR12MB761142838F98DC828AF472248CF62@CY8PR12MB7611.namprd12.prod.outlook.com>
 <e36678e7-1c2f-4d2f-b0dd-c1ef2e533669@altera.com>
 <LV5PR12MB9828AC9C97DA5FA9C82993F781FE2@LV5PR12MB9828.namprd12.prod.outlook.com>
 <LV5PR12MB98286D643E990DDDA63B8CAC81FE2@LV5PR12MB9828.namprd12.prod.outlook.com>
In-Reply-To: <LV5PR12MB98286D643E990DDDA63B8CAC81FE2@LV5PR12MB9828.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5950:EE_|IA3PR03MB7617:EE_
x-ms-office365-filtering-correlation-id: d8f84765-2d6a-4fca-107a-08dee3b0070c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|11063799006|4143699003|56012099006|4133799003|55112099003|18002099003|22082099003|10067099003|13003099007|38070700021;
x-microsoft-antispam-message-info: rU1vWXsk8Qu7ae4Rwhx6wlVZnFne7agVlp6RIGun2RxNqxGk7TiIXPtD+oT22dk9mlewjwgYUAL6SM6QmPJLXZ/O1ImN91MX5j53qB9SnCHI9rtr3obz7lE1fWk+481ZG4izHsUJtmCBcJ0n59Ji7uD9Qf+3juxIbMCLl5RrxrdBftfXVl8q9GC5QBmJQNST3uSa38JAHTcZb5WhAO9R8rm6Fz/2pL8X4tF07BuThlPr5lPiSxmJSuyczAATPQFFR/brQ0iXXKIx63FmEbUUnfgOCu95xDvd4HVTaXEZKgX1DSgNo+4TfSFgxWiePa6l/b9WkocYm/D+ujBkviopAHYoes3uIo5In2E5wQ6ClbogDcG14riMBed0Co8Cdqf6LaP+FQar2+3L47YOYlgCaUQAYJYNPmHrxVVUt6N/yWSuRV+T2AGVdB8n3ltSXc/VZ4TQKzGm03QyutXnNrlyPnRg5+0m34/SZ+TvPSbYy6AhLXAz7nM1hc9CPvKfGEn4pte8m0HZHzfECLkpCWnjSBqsHQnByFNqH2dne2Wp+2XOv+8XWrn6S8erv65fGArWH8/xOhVfUZyTWOv0soIvQcJ9ZzvwwwZbBD3L9eLzGCJgl3xmNs9LzfRBzNmiS71mItBdbJ462Wf7mg6QAg82zI/wX6mJ1jVX1Ku7ykBF4jiL4dtvwpHS9y8cvL4MDkDlx8OgXyNpWivBCAHfcsENZw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(11063799006)(4143699003)(56012099006)(4133799003)(55112099003)(18002099003)(22082099003)(10067099003)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUh4b1J0RWd2TUVYTWF4QzBUVmNqZ0JEekJaKzJIQjVmRXY5UFgwUTNCV1dY?=
 =?utf-8?B?TTYrQ29PdWJIT2JjVFVXcnlEbGVLNW9HMzdMRStiU0xEa1o3NUtOY29XbDVS?=
 =?utf-8?B?VytqQ3ZGcFZKZEFrQndwOTNBeXplTEdCNmMyS2pOSmJlRjhCUno2SE1mZFZk?=
 =?utf-8?B?YlJmZFZ0ZUhoa3RsK2RhdHlMczJFQVlEc2dTUG1KY2hhQW9ZMjVQVVh1M25P?=
 =?utf-8?B?QWdnVDVzalMvZlJsdWRhekJ0MHQwU2krV2RWMkJuSENaRVBXbEliN2NjZEJK?=
 =?utf-8?B?eFVBdDUveU5CTVl4UTV0eGh4NzBvOWllU1FEWEg3dVY1Ri8rS2ZiMTB4NzEx?=
 =?utf-8?B?U1dZVTV1VDF3RDJGdmJWdkhjbzZjVFFvMVgxcnd3UVY2a3ZpREF3R1hUKzcx?=
 =?utf-8?B?VkV3NzArLzdmNmc1dllrWjNVMmwvV3NhK21XeW9xeWFUcUVkbFRYd0gxRTZC?=
 =?utf-8?B?bVNvTVV2TWhYU1FyUW0zb1doNndqaXpBaFFrY3NrNk9ncHhtSDRPUWlBUmNT?=
 =?utf-8?B?Q25pK3JFUnFPMTJmbjdzVllMbWpDSU8yb2lsOVlGSS83QVRmWUl3QlVxb2pR?=
 =?utf-8?B?eUoyTGQxUTRMQ21BWkdTUjBINUFDYWhERkVFa3pUNDJ1UWREc2hHdmZCcExY?=
 =?utf-8?B?aEcxM3RIZXVrUzlEQlZSOFBxRGdManBjWXZ6bHZuWUFSVWQ2amVSVys0Ti9n?=
 =?utf-8?B?ZGwzUzhMdG05Tmd3Z1B2UDhaTTBPd2syWUhEK0lWMFJsWVMxYjM3azlrSlNw?=
 =?utf-8?B?L1hiRDFxYm90eGlxekZucG02RUJYbzI3NStQMllmVmZBR0dDdjJORTlVSC9v?=
 =?utf-8?B?eUFONVR2K1V3SHp1T3NYY3dBWkwyYTg1ZHVob21aZVI2NzdJZExZeDI5UkNQ?=
 =?utf-8?B?S3IyL1VqaU1talU5eVRMU3YyajVmeXhnenBXYk1tQWt1Q3I4NkwwcVBCcmxH?=
 =?utf-8?B?Y3BNRTVtQTErOEFiSnZyMGRhcmpPejBkR3N6YnZ6KzJnWW5Cb2gvbFpWNk5w?=
 =?utf-8?B?VmcxMXMzNXhuaGs2RElCVGdGVSt2OEhmaS9LTFlOaGRFVC9RWVN5d0owRFBq?=
 =?utf-8?B?Mk5DdjhLRm9DSmxEenVOZWpxRHFFWDRsQUdHeFJ4R0RMSXBENDZkSjdDRjRl?=
 =?utf-8?B?Q1JRK3I0c1NYWXpqZTc3SkVEM2lxOVVCZEM0VFQwOVdETG1zUGdTMXJNSzlU?=
 =?utf-8?B?b2NUZHFSVEF1cXBUUklpR1N1dlhJcGRzck8yUEJVRFY5NFd3N0J6UmdMeDVY?=
 =?utf-8?B?RVlGUm40cHVnZ3hsYmRCbHdKekJTenU1WkorT3NMVWc0OGFPV1lxSkFUaGMr?=
 =?utf-8?B?K3NsQ2tFWmpRbklrclNuWnVYcXp3bTB3dm9aNTN4ZFNpNzc5ZEo4K1dzZDBE?=
 =?utf-8?B?OXUzbHNPVGt0L3VpVWI3OEdPZzU2MFVMQzNXWDRkWHlMTHd1Z05JUzRoSnJy?=
 =?utf-8?B?UXVYZ3lLa1B2cFZYZXA1YjlCT3F6ZWt1TklFVkRyUmkybVMyM2o5elE5RGl6?=
 =?utf-8?B?SElyWXNUbkIycEJWWkt2Y1ZodU9SYWlkclpCNVBKMWJlSXppb1BsQlREREtZ?=
 =?utf-8?B?dU5neUZxSVIwTFlUV1krVFRBVTlHQkhoUTdHTXJWUFJiN1B6bUk1TVY0dUZQ?=
 =?utf-8?B?MmJjQ3dNSENZeDlKWDByRXUycDVvM2pSSzY5YUQ2M1lIanl0UTFCZzBtOVJP?=
 =?utf-8?B?ZytOb0lFZ1pUR1pwd0FDL3ZQbzNkUW5hVDZEY0lONmNIYktmVnhsM3psTis0?=
 =?utf-8?B?QnliTERKRDRyR1llY05HdDYrYWJKWTNPQXphQ2gxamNDVHIvL1pLbmdMUWUv?=
 =?utf-8?B?SkpxaXJZU0g3L3dVMi9DUCtzVVpRZTdFTE1ONFFqQTVQVmluYWpnL0EyT0lw?=
 =?utf-8?B?RVQreG5CeFYwenpRckltYnhMQjREaGFoMnYzQWFuNXYxODYyUHUzN1llaXZj?=
 =?utf-8?B?cUlOVmlRRkV5QWdaMUtYbDdKa1UzUXgxemZVTVZZY2o4VlBJU2dSbHoxaGRR?=
 =?utf-8?B?YXFNbVpzK2pTU2JLMXV4Q0RRdy8xMGJjNDZrWUxmNWJHNGJ4ZkpQL3hxb0Qx?=
 =?utf-8?B?VXlhaXBCeE9jczlTN0ZuS0dBbWRFenRNM0drZ2R1ZGcyUTFQdUo4WWtmMllV?=
 =?utf-8?B?Z3dMYmpUTHJxM3RJWU8zV3ZlV09mY1pVNnZHS3dzS3Fvd0hFQkxiOUVBSFhM?=
 =?utf-8?B?WW81VEpBR1pNTWxkMGNZNlk0RS9qNC9pWG5CWFI4MjlTVXJnRnVmUSttS2FF?=
 =?utf-8?B?S25qb3kvVlFpQzVwRzlva0pYRFRUV1ROYlJ2Vnpua2ZvTHBtKy9ESUh5ZTg2?=
 =?utf-8?B?ZmVCa09zRTlJUTZ0aVRCVjJEQ2M4ZlNDYWxlZEhaNFJnaWZwWUpRdz09?=
Content-ID: <9582A177BDC5604484DF01C124982752@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f84765-2d6a-4fca-107a-08dee3b0070c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 03:03:50.4814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DZGIhTR7XoYPUG/Je4kV4vQB0whb6WvHn+t/XmA2vQ8zHxDO76ZcFlwxss2ZWK045WD9e5drVXo4ZszgzL0EmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB7617
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_200357_218545_7516469B 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

On 9/7/2026 5:09 pm, Datta, Shubhrajyoti wrote:
> [You don't often get email from shubhrajyoti.datta@amd.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> AMD General
>
>> -----Original Message-----
>> From: Datta, Shubhrajyoti
>> Sent: Thursday, July 9, 2026 2:30 PM
>> To: 'NG, TZE YEE' <tze.yee.ng@altera.com>; Guntupalli, Manikanta
>> <manikanta.guntupalli@amd.com>
>> Cc: linux-i3c@lists.infradead.org; Frank.Li@kernel.org; Frank Li
>> <Frank.li@oss.nxp.com>; Goud, Srinivas <srinivas.goud@amd.com>
>> Subject: RE: RE: RE: [PATCH] i3c: master: dw-i3c-master: fix OD timing for first
>> broadcast
>>
>>
>>
>>> -----Original Message-----
>>> From: NG, TZE YEE <tze.yee.ng@altera.com>
>>> Sent: Thursday, July 9, 2026 12:12 PM
>>> To: Guntupalli, Manikanta <manikanta.guntupalli@amd.com>; Datta,
>>> Shubhrajyoti <shubhrajyoti.datta@amd.com>
>>> Cc: linux-i3c@lists.infradead.org; Frank.Li@kernel.org; Frank Li
>>> <Frank.li@oss.nxp.com>; Goud, Srinivas <srinivas.goud@amd.com>
>>> Subject: Re: RE: RE: [PATCH] i3c: master: dw-i3c-master: fix OD timing
>>> for first broadcast
>>>
>>> [You don't often get email from tze.yee.ng@altera.com. Learn why this
>>> is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> Caution: This message originated from an External Source. Use proper
>>> caution when opening attachments, clicking links, or responding.
>>>
>>>
>>> On 1/7/2026 5:06 pm, Guntupalli, Manikanta wrote:
>>>> Public
>>>>
>>>> Hi,
>>>>
>>>> Adding the below contact:
>>>> +@Datta, Shubhrajyoti
>>>>
>>>> Thanks,
>>>> Manikanta
>>>>
>>>
>>> Hi Manikanta, Datta,
>>>
>>> Gentle follow-up on the AMD AMDI0015 quirk question below. It has been
>>> about a week since Datta was brought into the thread, and I have not
>>> received guidance yet on how ->set_speed() and send_ccc_cmd() should
>>> interact with AMD_I3C_OD_PP_TIMING.
>>
>> Will check this and get back.
> This quirk is added for the AMD legacy platform
> https://lore.kernel.org/all/20241114110239.660551-3-Shyam-sundar.S-k@amd.com/
>
> added shyam .

Hi Manikanta, Datta, Shyam,

Gentle follow-up. I still have not received confirmed guidance on how
->set_speed() should interact with AMD_I3C_OD_PP_TIMING on AMDI0015.

Rather than waiting further, I would like to continue the upstream
process with
- od_cnt calculation fix (per Sashiko's review)
- using  PM_RUNTIME_ACQUIRE (per Frank's review)
- send an AMD-specific follow-up based on a best-effort assumption for
the AMD quirk platform.

Could AMD help test that follow-up once posted?

If you prefer a different AMD behavior, please let me know; otherwise I
will proceed with that plan.

Thanks,
Tze Yee

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
