Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED6C10FC456
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Apr 2026 01:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AJZ4GUVb97vnu5qK5wMN9veSOIeOz/qCA1rgN0MtTT4=; b=128hzI4Med0OGm
	iBw4wLxnL8gkIg3x3VrHNoxH7U/wVzbD6KOtmeH2J80tX9oj6sUMAmk1rJaH3RU6IDpTjhs2nEfOS
	pQFS495RhM6Gv+RuPSh+GgmDqw92hd5ojDD/5MSIgaZbH7eHAxLxe2jYnvj5Tk1+kkcVDze/NUwEk
	uiTpwO+forgAcE8EvYA0EaoEFLENcUggY/rStu190pJXRIFUJjNAxQL4XjBJpglpGjRosJvTZ8dba
	EZjhUkxHiclTuMnv6vMarIC7dVnTV8fs+HKue4GRrY8AF8LSa7Z1+hNw7wh0XeLXSVc3Ge92nknZ/
	6fqhVeA5RfrGgq7V8wiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAeF5-00000009a7O-2Byc;
	Thu, 09 Apr 2026 01:31:35 +0000
Received: from mail-japaneastazon11023088.outbound.protection.outlook.com ([52.101.127.88] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAeF2-00000009a6a-4B6T
	for linux-i3c@lists.infradead.org;
	Thu, 09 Apr 2026 01:31:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VITXhYM7sJ7OHpAzTZDVnRJnVjARoY5z+kMQtBrfcSsszvmzEUlqE4d8D3vpgz9+oCRLi8ezQAqRK4qJzUf2wrx7t5pHR+9DUNQx+kPQx6O6x99Ies0XhjCPpGprMq63ZbLhyb81AFLQKi+ryOE5jblqjp8j8cm96VyrM4bXjCuCUEtAlOULwMGzKguh6eZT8Qf6nMfmQwO1JvdXLk2ED9P+O76IawxQvtdH69r4zojSB0XMG+ZV0WZkOSAiwpytjVh2KnKTeJ7GC1ELNVmuSlckMA9OwrV+hWlTKETJ0n/YXzwr4coYLAIrXTGeS6lpW/+UEXumuvDskyAA8IXMyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjZF4z8QTJNppREGxIR3cDj+83orE2VhK90Hoq1yEdM=;
 b=lgqYHW9Hq0rQevYWs8Q0XiSM69tNs6HEr/2kGfmh4IcfBfquYxIB/invOJlWwMDM2sEYy1UJBekkiL7O+75UG36q14ErADYVqEZq7VDa/BIvH2PWsv17rKCexAkgTz7BnY0FZt4sge4eJeq5xwi7y9NiGIDzjY9flV+aJUzxwhWrNJQQkCDvC/fIgomq8pkJLvRkx/uHbgdlCawqYb+g+PCWPeC2vDBGKQj0cKjJ32h6Y2VOkmNkAx4yxNWF+Ac/GI9QN8H08yc0HJzEQOg5Sy5bfQB40b3WsxUW17Z0ZkmcBfLlYwALf/59p95fuMD95mDkWwuhVqXpkTs7bXPUSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjZF4z8QTJNppREGxIR3cDj+83orE2VhK90Hoq1yEdM=;
 b=cLDFjg/W/Clhzo2qYzPcg8XKnkIH8FFClWAYkltEzNB9w43zwdyFUcRm2k0HwEmF2ARIgdB6KuzrWP0ARWsIr0y+Yu/YuN7rKvpWqbwa9rwJBYOgaMmrbUhKMeEv+8W0RQpxoUVZaTd7MIpBYczyDR4MSWjYTKqYEumVKoUlyBH8y/0DPd0tcARImojeSkmCHhh4eX9/5pJXtMZCGt5ZMrREU5xD/0Y1pKDUrKiAFpazJ6QJHCT3ZgdC5qkxlhohwXw/wuDRFJqPDbMJxZVUOLMUw6V5Y+IPNKD4ogx8Gt9AImTfpUNkQvSYUAjeHrErBrgqcdaNOJtQ/+aBD1eIgA==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by SEZPR06MB5197.apcprd06.prod.outlook.com (2603:1096:101:70::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 01:31:16 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19%4]) with mapi id 15.20.9769.015; Thu, 9 Apr 2026
 01:31:16 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Frank Li <Frank.li@nxp.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Nicolas Pitre
	<npitre@baylibre.com>, Boris Brezillon <boris.brezillon@collabora.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] i3c: mipi-i3c-hci: fix IBI payload length calculation
 for final status
Thread-Topic: [PATCH v2] i3c: mipi-i3c-hci: fix IBI payload length calculation
 for final status
Thread-Index: AQHcxmwFvtzQ1a5bfUSce5jTo+DNIrXUyOKAgAEp7xg=
Date: Thu, 9 Apr 2026 01:31:16 +0000
Message-ID: <OSQPR06MB7252E35BC0A9F2ABFFB80B6E8B582@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20260407-i3c-hci-dma-v2-1-a583187b9d22@aspeedtech.com>
 <adYFwaSP2uODgr5J@lizhi-Precision-Tower-5810>
In-Reply-To: <adYFwaSP2uODgr5J@lizhi-Precision-Tower-5810>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|SEZPR06MB5197:EE_
x-ms-office365-filtering-correlation-id: 8f85ad24-86ff-4ab2-baf5-08de95d7b191
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|56012099003|22082099003|13003099007|18002099003;
x-microsoft-antispam-message-info: wOjcGu68Ng1YkxIHYnHarv1pl0jNVGJwzHKHqNw5RrC/rc9YLjFPRvgbqBJ0RMuqB8h5m4rKIkISzCuSHHOjTmSIIE0N1rNIe1HFzBCuqzN4gZ6QYaCCBhV2s57AunKjpT4m6fEZ+cdCemEyj+0i++TkCKRRBLnQ/6MtxQiPO0papugS1620+bDhhdRnjW8rjhmCtpj9XWj8xsxXumgXbmvvF5BRsWHna84os2Xbd7UWB8iNs82Z3DseOeUDAOkIZaFbDNln5OQ+o4v4QBpTKJOhIsuHD3Mcr8PLxsiU/4ffE4nSc1WHi4cLeiSo3VbeccHIkFvFZ6pyowhcZYn28lbWPdDBrD21hKwIUFIuMZBkBHnP25UFQAj739t/aQenLfROjie2dHnvVF8R7Bjeda4cQgc3EmGFFDdxp2I+fdxF88mdsa6/rTROuhZ15TJvBrD7cjeogzN/Gp8FjmPiCWq+vb2yzD/ZEAsOGMD2/9AmAZRVubE/50wQ/wnL643JEw7S630OE9fJB5qpdGOGJGEVJ5NZ6uypQy/a3KCXb6KuPr74Iuv2wUWEUBPI3AZKfL66fJY78F14HXUGCc6BFKrJtPkryoKewuiY7m8y2tX57caQABk7BqVNiVHSSBZOr4WjboSgT+caEY2qbMv9X2MHF6XPrMKHEbUF90odziDZ7EIeFHoCIAxR+fVnJrnZUOTl1YhUd0tZP4nQYNKIO31DA/6gZYu7z5wel+WRNzXsAiby/Q26wfUWK+mdhpW78x7jOa+73Osly2S7DW8MqR4Twz31FjgECZ7yNbaefG0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(56012099003)(22082099003)(13003099007)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?fcpmxu/JvqEeQPtDXKmOskwIIWBYkxG2Egkt0eS0PkXPQGBWTkErfojdCF?=
 =?iso-8859-1?Q?b0URTZFxKW1qDEba++uCp0e+PrFY5aSY05KPtYlXBMsWoCUU0olrcfwjUn?=
 =?iso-8859-1?Q?kYtz9yl+NsCUIDpiTHuikmGN1FDuEYNv/phsk+PZpnWxL2KblfVTUGlExI?=
 =?iso-8859-1?Q?ImKWyr0qGsne7zIrRBVjm8RdrFz7P6kwAP0Ow+o/Gzj8APmLdx/I2eggFr?=
 =?iso-8859-1?Q?pbqrDP1n3LrGaLXJHeO9OvBywgj9YcKpyS547dvMtZ7UElYgf6WMymD2vC?=
 =?iso-8859-1?Q?o1esb57eyKW2JKty3BvwT+vg6i89noURiQWWrQVdJGcag3L2rnJN0l3xkV?=
 =?iso-8859-1?Q?d8d3z09jr6RH9YawEOYQHdDfZ0y2bhdOEusWseeYmGNeya6uOrOiv4eRdu?=
 =?iso-8859-1?Q?y/e1ur35SK3l+b2RovGWA8ayzBTh8NRUU10pyf7iDCMsflSzSU8S8sq7BF?=
 =?iso-8859-1?Q?Cu5flyE4wzUX4/onr+gOPdO1HGKZjS6ovMEKKafoe9sG4YowlnUoKlrRMv?=
 =?iso-8859-1?Q?/pOlgpFwOUISMW4otCGKthUU3KL/2EoDMrNuNLHXEkNxr7uZgBdIO7nm6P?=
 =?iso-8859-1?Q?+ykXclVoLXozjZq1h8MsAeI9/q+aS+KN4oXl+e68HysWwVzIxVKwMvP8M3?=
 =?iso-8859-1?Q?IduDzydenx0m+BxlKv5evsXOeeZIkrrD2uBD2eSnCS06KtGG/qU9SdQJ8c?=
 =?iso-8859-1?Q?PPCa64sNJ1CTdN+WVB+wnPaSmWhlm0hPJePBKveIZYnpI1EC2cK9lvmjGN?=
 =?iso-8859-1?Q?WSOKlRq4s9/dXgF850m2/IR2Z8ubHt7lqtYrmiKB/cAZW8S+5KEiC/4DXY?=
 =?iso-8859-1?Q?hDK22VerdnHhshYDvYm8WrUnIwQqtteiS7dq4rigBpNIIeVZuW9QmtkOPl?=
 =?iso-8859-1?Q?1AmwwkAZPIhsSFEVZKaIZMsAmPR1Ce+oE/5JRNRyO7QYQeKVTDen+vW+q7?=
 =?iso-8859-1?Q?7O4+B+E1P4b+yXdPDfn5/v1XaJb52yDtK/KLyn6AdaohGqkxTugmHOR09U?=
 =?iso-8859-1?Q?98bOhx4TkHyIOLmvyvTpipJf6812lUEY3t/bDbiYW5h5TEFY40V6wYp+lV?=
 =?iso-8859-1?Q?V8QD1Q/w4kdqOmbQywYoo1yffHRLLCfhjAYEi5c2de6p/Zh/Q6KNkN/uGT?=
 =?iso-8859-1?Q?g7np1I11iYl5lw4+QYo0Hnd8ioby6KYezfDQsZbv3MHvVEknRPKrsfGMml?=
 =?iso-8859-1?Q?vrBOvrzZwmdTT/cadAt56JBaYOm6ex8304OoyK3F+oyV/QzHkDxsbacuzV?=
 =?iso-8859-1?Q?qAEXY9ZbtAPD3hubcSuIw+8VBtmiP88p+uYUydPUs4G6VyIS0V7SfLbF7Y?=
 =?iso-8859-1?Q?MDRZ+TWUWOZlq6sZMH1X9xtUc69mYxOK9rkh2EUz0snte8QzOu437zr9cG?=
 =?iso-8859-1?Q?kV5Xp1Bl9iqfw1H+A64+kErzVCCC8QdmMYYWdCK2ddG12MHIlU38zU/WmO?=
 =?iso-8859-1?Q?wmyY66GQXV+hzGfk34epT+Ejc27gojBYBiMP20MfOn03OKU2HGLeYEhRAg?=
 =?iso-8859-1?Q?vIsdutGfXtHCSuSBIleybYd3qcARHlyJt0oju6Ql9ZjRjFDuyxU454qcdk?=
 =?iso-8859-1?Q?ficHbrSBQyqi9vO/YTbsnbmjmOiZLkUCO+CBENDlOO6wBVxJxZ1he+VYPS?=
 =?iso-8859-1?Q?GmN8u7YTMc9PNi/Ggcl4OYfnfXpCQVu2lhBRlwXoPbGY/5h2iZbGbhX/QW?=
 =?iso-8859-1?Q?3A/io/sf9FwGVrxghD7MlVt6xigxIEu0+r4mIxI/LmW4MDR6QBw+cREBIX?=
 =?iso-8859-1?Q?4XfF/0HRRSIkoDM8fudtKYiHZY3MLFOHlUXCJgGLh7UsRhhb5JtSxAAnSz?=
 =?iso-8859-1?Q?r4NxncbUbw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f85ad24-86ff-4ab2-baf5-08de95d7b191
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 01:31:16.2352
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oDhSSPHdPHUPrUyUTZX3jzhcYnNh3Y/Jc8UIsFYTc5eSYVV/CK3ON0M7TvbGx/vk5JbUoJkMpBJuEinFhCs5Tk9vha8XPBbd7TAVw+H5NeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_183133_329899_1D097315 
X-CRM114-Status: GOOD (  21.97  )
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
> > Changes in v2:
> > - EDITME: describe what is new in this series revision.
> > - EDITME: use bulletpoints and terse descriptions.
> > - Link to v1: https://lore.kernel.org/r/20260331-i3c-hci-dma-v1-1-e5cd295c44ff@aspeedtech.com
> > ---
> > Changes in v2:
> > - Fix IBI processing logic to properly handle IBIs without data payload.
> > - Link to v1: https://lore.kernel.org/r/20260331-i3c-hci-dma-v1-1-e5cd295c44ff@aspeedtech.com
> > ---
> >  drivers/i3c/master/mipi-i3c-hci/dma.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> > index b903a2da1fd1..c7272155c486 100644
> > --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> > +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> > @@ -721,7 +721,10 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
> >               if (!(ibi_status & IBI_LAST_STATUS)) {
> >                       ibi_size += chunks * rh->ibi_chunk_sz;
> >               } else {
> > -                     ibi_size += FIELD_GET(IBI_DATA_LENGTH, ibi_status);
> > +                     if (chunks) {
> > +                             ibi_size += (chunks - 1) * rh->ibi_chunk_sz;
> > +                             ibi_size += FIELD_GET(IBI_DATA_LENGTH, ibi_status);

> this should be added to ibi_size reguardless chucks.
> 
> if (chunks)
>         ibi_size += (chunks - 1) * rh->ibi_chunk_sz;
> 
> ibi_size += FIELD_GET(IBI_DATA_LENGTH, ibi_status);

According to the HCI spec, CHUNKS represents the number of valid data
chunks in the IBI Data Ring, while DATA_LENGTH (in DMA mode) represents
the number of valid bytes in the last data chunk.

This implies that DATA_LENGTH is only meaningful when at least one
chunk exists. If CHUNKS == 0, there is no "last data chunk", and thus
DATA_LENGTH is expected to be 0.

So a combination of CHUNKS == 0 with a non-zero DATA_LENGTH would be
an invalid descriptor encoding.

To follow your suggestion and still keep the logic robust, we can
always account DATA_LENGTH, but add a defensive check for this
invalid condition:

    if (chunks)
        ibi_size += (chunks - 1) * rh->ibi_chunk_sz;

    if (unlikely(!chunks &&
        FIELD_GET(IBI_DATA_LENGTH, ibi_status)))
        WARN_ON(1);

    ibi_size += FIELD_GET(IBI_DATA_LENGTH, ibi_status);

This way we handle the normal case as expected, while still catching
any invalid encoding from the controller.

Thanks

Billy Tsai

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
