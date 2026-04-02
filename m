Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C109CC6B1F
	for <linux-i3c@archiver.kernel.org>; Thu,  2 Apr 2026 08:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fYjItn8553qt7b+ze7X6gCmM16lmTtVQ4aFdmyRoWiM=; b=ikfmpvVc45Gahy
	4VpGlas2T6fi0Ym/AC1xr2rndEf4S9vuKmFDCqThi99j4clKjXU89GyUt+QDBL+V1wrpgXVkMGXRo
	rNgTlXwwRItLl5JFY7H2756PECpuTEgc7Y0TC6fHYAcozZD2t6fw9Kk9LpuhvLqJsJ87HcYztRDFL
	C3F0yatvwjyZhuV7pzImHUteiH3Nj32lgVQjpI2LMMfxFq0aARQH58dbZkwWRsE+Q9DYJlyJmu0FU
	mDjf9Igm/f7mVtCifrBMirhiobQF6Ya63pz5Fsg7JVG8alw+QLYClLWvNqJgaRIgBWrEizYXslg6i
	iEVCGHZtMWgCpl1UC1Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8D5u-0000000H8uJ-0ljE;
	Thu, 02 Apr 2026 08:08:02 +0000
Received: from mail-japanwestazon11022125.outbound.protection.outlook.com ([40.107.75.125] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8D5r-0000000H8tw-3zwR
	for linux-i3c@lists.infradead.org;
	Thu, 02 Apr 2026 08:08:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b6JL+ee2QpCyBIgyvrCBhle0vEKb4MsI3n31mZ3tUhLLt8vajowZ0GrDTK48xZPhJmYmyavsmeL1dvcUpbZaJ1DvSi6crr4++T6nHHju9zoWqRegy6/+mk7sOWHHl5mtWnyVn9eurlXqvhkmw8eLFdVIiESAlENqNz+zmqvTVTM8Lh3tLFfqI+brciPOv8G79rK2K/9Z8vD52ZlJthoJSNRm+RQx3/fREE6u7CHiDIk17e5Ln+y1/8i8X+KkLX5w8HqR67wskXGx7moz549JePlJfXxmaQ8CkBmAEEGT3A9WHmdn86neFTt5GQj432dOaHpvqRqRdhbDhWWGNA+ukg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6z1IN5samPb2MUUC6Jyrpv2CiA4LhqfMWeYULQS+N8=;
 b=XzIDzhyRyVSTBao3x+mZMLhs8vdl39alPevv+9MP6xgWgCYcNJPOdwmO4WhYFeT3q7ygHDL4PQF0x/VO8K1cfWl81lECw/jXN/VnovOWU2U5JL3jSlYgWQJZg+Wd0W9vt6mdtZ9jQfcBxUihTq1N74v749OcI6dC/68bei1SjHoZyFmqd9Ba82ils0tZV+Q1wQua9z+kymJoEompdctxNYAJdDJLUzcUaY4qrtptXjV8kScmHwe7eqfL1nmYZTs8gZyZzE79oqt5ASNhbbZICFFzEU8IKDJqdO81iJb0mHkjqoqFjHmPLNg7b7xQLFAD8GzHSR76SIcrAoC+V99Ssw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6z1IN5samPb2MUUC6Jyrpv2CiA4LhqfMWeYULQS+N8=;
 b=D0/4CZxLOdHVlAHlmr5OYYW+d1QOzfF2vuhZIEk6Haq6lFx143DSD46Ny2ATY7kFDUdK3UdG2CuW2QsL7WeRxecvePTer6qACfjfjMKsvr6ZKIuaO8qlQmgkZVwmtqpiao1k65ZiJLSVAw0jO/wZ+/620Q8nyYtqklRD8YliD4T/fhuX3mf1zJqhCCAAdYTldnvGEnnMjFFXqFSGU/EdFLqOJqpqKg+HVIaSDvYkEfWzGbq0dELL/G6DgnvODQy0PjEuHtHb7JjbvsgtQrRRwBKPiYt22sVdD6PAyVEEZOoEBOZXvIPk39JpOnDGSldr/1COQcVRlF8pWUbZ4XpT2Q==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by TYPPR06MB8104.apcprd06.prod.outlook.com (2603:1096:405:313::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 08:07:46 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19%4]) with mapi id 15.20.9769.015; Thu, 2 Apr 2026
 08:07:46 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Adrian Hunter <adrian.hunter@intel.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.li@nxp.com>, Nicolas Pitre
	<npitre@baylibre.com>, Boris Brezillon <boris.brezillon@collabora.com>
CC: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i3c: mipi-i3c-hci: fix IBI payload length calculation for
 final status
Thread-Topic: [PATCH] i3c: mipi-i3c-hci: fix IBI payload length calculation
 for final status
Thread-Index: AQHcwPj8g7NVaZWW6EuCuBxZg6FVg7XKNmaAgAExa8o=
Date: Thu, 2 Apr 2026 08:07:46 +0000
Message-ID: <OSQPR06MB7252F5318D15701533E5058D8B51A@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20260331-i3c-hci-dma-v1-1-e5cd295c44ff@aspeedtech.com>
 <ad7cd33b-3424-4532-b38e-f8f9c5ee1ad5@intel.com>
In-Reply-To: <ad7cd33b-3424-4532-b38e-f8f9c5ee1ad5@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|TYPPR06MB8104:EE_
x-ms-office365-filtering-correlation-id: 9b0a5dae-5fab-4e53-d1f8-08de908eec8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: PaOvxcQIiwHwdjqgQxCrVYmfOm0MYy8Fww7SEgaPR/PVT/ZkOb2mnmAiZtAd1f8LZ3fFc+ozmBUWrpI/jQL21/b4NnK1dB9ERUoRBhBpI83ZES1YFYZNoxqT6UlAUIpSkMdG7ntypj3wLHtM7lhClAigS6boMMeOvVXEepwygll7HDQ+ZHebVoimHxtDDcU2ZfKj6TL234olcPDmUn+/rfiFz6rpt+dB2Wj0VHN1YSoHcMiFmMtcc0evHuzft5x6VbvrLafUz/r/l2Vwu5eOo52sbz5q4hmBak5L8NAi9FoX+FxhWRcd9+vyE1nQ1mA6fja6YsqwSOMJN77jirLJSON+X8imByXr3DtS065cjLctYjEDEDa2ka8O10LsQjMD+JfrS6MNRt+A1WLBdTLV9HvvEeAQDk7kTC/mSPzRoH27Q7xDvmRucz7tw7Ae54g3EBjnqpTPswV5L6XRYFNcyf6X5yQbrVdMC7RKXl1pl4mPel5j7XyIh7p5B8B0N+wvcRbtPbBY7EiEVGh7AFLMtQmyetNulwpO8+DbEzTUG+NShpNQa3+C/g9O8LusFB7wX7d0bd9o76ZAOxZy2ROZ9Z4Ef2lPITh1NT1gvMqDY2fTvfZqXIUWxEw7Q6Eji9/9kff3fIPgfTqFwH0QtcxBqTw8J/Js86brd+dF4MRM6+Htp+x2b0Gd+6p6P6tOqvmwSVNOa6SKecxtaW4mqa/lkX01FLFzh9kh3LwR9Fr/Ic31MVz6YizsjySXAgpSIJIJn554G/RirsOPWBfd07WoUkKVPmS1yGzG5YrVHWCGguk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?haf4lvq8YvkXWdvu9n3EwGpb7opRAcib3PucF4QsQl0S/VDGZayjs7eYnR?=
 =?iso-8859-1?Q?xCXh5wD1nYd6pJwxNwNtaaYetNGakAQr5lMxIatgfOQcpJMw44KQWNq6Bc?=
 =?iso-8859-1?Q?wakaFMhgi0/0hWvbTohQQDLg1OiXa7Xbj/zA4rpe81+t2GT9ev3tBgr2g3?=
 =?iso-8859-1?Q?aVX8O4/BGikneb1vCJ3EqEvTXGQUPp7jZewjpbMzGs6nJm4MU4UlWEIPid?=
 =?iso-8859-1?Q?8QBd2sB2cC6tXuuFMtG62LCFXrJirCdPUf44PHI0TfXkunMYvnbAuePHWH?=
 =?iso-8859-1?Q?AzSTl+mFPA0S6VWyvzWOW5mP3ZzZ9RIMcgbvA+mHsrk82cHVYUyoEaxKbK?=
 =?iso-8859-1?Q?fjt2/JobeScP/kzVm7Bg/AJALWK6OZROm8apizPPdLB/sdNcYnDuDecJ+J?=
 =?iso-8859-1?Q?v7o3qoqzGMNI6AQ/a+ERxCLB8vGutUdUq4Hv9goDfrYCkynrGKGwzcrEKp?=
 =?iso-8859-1?Q?KQ0T4ooDtX6jef7ufXmS6Kw8VcrSlS/mLdiR0uK7bgi+NZWTz2oysZrpHT?=
 =?iso-8859-1?Q?9dYFv/oLWsnp1at110Mu8U/ZkGxm2che5EQfj+Pmcidz3a1URKLeP/kXFu?=
 =?iso-8859-1?Q?sUmtoT/GdSP+9PC/rND5wg1rJVWEVuwip2ZpRb58FjCKhrdpRA4hIFES+M?=
 =?iso-8859-1?Q?zaucZE22iAM/wQ9qa+pJYjDJH7OT27jwwasqdS3k83uFWScrD6qjNcprVu?=
 =?iso-8859-1?Q?xdlNpkpxFi7rpb+n/PSZ0D6x2rr2B/aUUTKghznAdrAdCftTNDfxRKsYs4?=
 =?iso-8859-1?Q?cngSkfy38tB8K+UBNP2xtwnHB2olZsyLANT0V+LTnup8/i1tb8vqIbOchU?=
 =?iso-8859-1?Q?/FeYekNQI0bMLoUhl+zlUBlIPJ3sR70Mxa6eOj8L+2Qk6AwLBzupZ79xz7?=
 =?iso-8859-1?Q?S5uMuCuLnm/gmK5y69h9M4gMChQN9TVE0ew4HV4NowBuQ2o9WcDvoBps59?=
 =?iso-8859-1?Q?oOy3BkaArJN6kIeUjoFXqB+sdKa7l8as9gf/7vuua3UcpMb+tG6U4jifLr?=
 =?iso-8859-1?Q?Mh0GSZyW3DOYzj/WGa8wz3ugitytDI0E/lQA/ZRvppOwIFuZI4bg4wzdrS?=
 =?iso-8859-1?Q?s4mBuZa+jQT3sPO2NiBmpjQ2Xm+U/fLtajkFQkVfzHNTSTHlOm6HBETPPd?=
 =?iso-8859-1?Q?UWXx6avNFEzzJgAuyFKcbvurXJnU7YjO55qvtoRB9lPAJxaKBjb2okSkiy?=
 =?iso-8859-1?Q?egtsnp4OiVcOmEYmKgMxSTHCIEVu6XOhUEQqiKslh0tI3BO1GcQjVA0AnK?=
 =?iso-8859-1?Q?7kvGBA00vk9VnNwBuPBxwE93b4OXT3HJF8z60n0oisxjfvqp5xvXRKwdik?=
 =?iso-8859-1?Q?4Gpd66Whtkifozpuco781VmrDnhAArAM+fy47L+spmZ4eJytmJH4ZS81kB?=
 =?iso-8859-1?Q?NyPr8n/yTrEWpClUt/bdCdxu+qLmlHGG90aJmBuO3JJERrc3FQ48IWIqMU?=
 =?iso-8859-1?Q?/zKc26/o6NmP90HBgl6Uh46gmK3ofWx15S0f0O6t+qeq2rdcZUGtdxR4Mc?=
 =?iso-8859-1?Q?mM2tMyODCQiCTB8zNbFKyHNwVKh5uIno/W1L8N0RXJAD8QxQTOJrhVjAAN?=
 =?iso-8859-1?Q?WdiKO952BNWnQqN09D12QXjJU74zk8zrbjkMWmlXrtEcRdfS/Neh9jpqi0?=
 =?iso-8859-1?Q?7miXV/ACqp23xaXR4BIFvzs4RnE5wU/Iyy1h7N07cgA0ONw6WIohdg1286?=
 =?iso-8859-1?Q?x8+J8T7TlZQiq7oayDnTnu9r21kJFA9RqorlhYFgOwOQ+KuFAlcuAatrA2?=
 =?iso-8859-1?Q?aGcZzCOM2vPDYItbIc38PddC6D7L+ww0t+LQRs1r4ojj6JNySmNDF4ZH7J?=
 =?iso-8859-1?Q?xXoVM2Q7iw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b0a5dae-5fab-4e53-d1f8-08de908eec8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 08:07:46.0610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8BpNeqdxksMzt5kiN0O21ScmzfAm2NNgMuPy2hC5jYQDWuEXsYmH5vOsXMEUxahvRLRgkrCjnNQG+NE2rruoxURoU2xMoGm1VsrXnO7no+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR06MB8104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_010759_991600_6168542D 
X-CRM114-Status: GOOD (  19.93  )
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

On 31/03/2026 13:27, Billy Tsai wrote:
> > In DMA mode, the IBI status descriptor encodes the payload using
> > CHUNKS (number of chunks) and DATA_LENGTH (valid bytes in the last
> > chunk). All preceding chunks are implicitly full-sized.
> >
> > The current code accumulates full chunk sizes for non-final status
> > descriptors, but for the final status descriptor it only adds
> > DATA_LENGTH. This ignores the contribution of the preceding full
> > chunks described by the same final status entry.
> >
> > As a result, the computed IBI payload length is truncated whenever
> > the final status spans multiple chunks. For example, with a chunk
> > size of 4 bytes, CHUNKS=2 and DATA_LENGTH=1 should result in a total
> > payload size of 5 bytes, but the current code reports only 1 byte.
> >
> > Fix the calculation by adding the size of (CHUNKS - 1) full chunks
> > plus DATA_LENGTH for the last chunk.
> >
> > Fixes: 9ad9a52cce28 ("i3c/master: introduce the mipi-i3c-hci driver")
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> > ---
> >  drivers/i3c/master/mipi-i3c-hci/dma.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> > index b903a2da1fd1..f4c76f168276 100644
> > --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> > +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> > @@ -721,6 +721,7 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
> >               if (!(ibi_status & IBI_LAST_STATUS)) {
> >                       ibi_size += chunks * rh->ibi_chunk_sz;
> >               } else {
> > +                     ibi_size += (chunks - 1) * rh->ibi_chunk_sz;

> That assumes chunks is not 0.  It would be better to
> defend against that possibility i.e.
> 
>                         if (chunks) {
>                                 ibi_size += (chunks - 1) * rh->ibi_chunk_sz;
>                                 ibi_size += FIELD_GET(IBI_DATA_LENGTH, ibi_status);
>                         }
> 

As expected, the value should never be 0, as this is guaranteed by the hardware.

If we add a check for 0, it may be appropriate to include a WARN_ON message to
indicate unexpected hardware behavior.

Thanks

Billy Tsai

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
