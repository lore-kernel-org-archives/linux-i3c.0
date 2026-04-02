Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F016BCC6B3E
	for <linux-i3c@archiver.kernel.org>; Thu,  2 Apr 2026 15:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VqEnus2Q+YUjAHv8wLq/b5czrBUXc+84uA0VdzGRZCQ=; b=QoerQn8VaNfOZS
	DmpjAuaES25VJqNxRyBceC2ywKGi+7QYzZ5bYGkK8lCqqF5vrcPiVEqF04+azNh8K5hlBmC0gK/4/
	5TRDvzXGqrnCuuvYxBeDC0NRXJyusLHEDiraR9faez1uShqzBHPOJq8tHUwA8jJzOZV+cfBk5D7SV
	HMVUjNfm+06FGTW0GetJo8X0p21oIOR9sTlz14grnS++spGpLSiHCcyPzLVM/VWd0jjokgoI6oi5L
	fpCqS9bima9e/RObLxFKfJ5BQvP3AHB5uQ1TbxV7wO2Z9/eg/Bk9D+vYq4cSef7LKGqCMsNxktaZT
	SeQTnjsOhs2GaNao4tlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JmW-00000000Qj9-2Z0L;
	Thu, 02 Apr 2026 15:16:28 +0000
Received: from mail-japaneastazon11022120.outbound.protection.outlook.com ([52.101.126.120] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JmU-00000000Qif-2WHg
	for linux-i3c@lists.infradead.org;
	Thu, 02 Apr 2026 15:16:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LF7ATH9rwmqZ2NGcbxK/lCbULZHKbuWv64tW7bUH7s8BqiWId/vf9AQBnE+j4Qde+mhubI9DvG3urHoTFOzj9qXnedxSxehZpG7M0g6B3KUljCINOVK97ZYTT70BYfvgU8+Ax056/vOaf92JDqEQ8aHdzq3CTN6h5YjPMyWojMeatVtD/pHhV3rAwkmPcWN1myFkAOraw5Diijix1kZv00zQAYu/jJGuzsTDpsw3obCCDtEHV/8nlVBIxjO8ZS2D9RQGPYUAgdUeAUyHiVa8gfo0FX5+ge+TFsUQoItQLasdfshnY5cBsSzPbWefbhdQszU6RBypMbdHqoEEcsGJKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hL8XK/abinzPMQvoqYIOTJBtOfMB/i/ngXBb+QGCYas=;
 b=rqustU+6XrFsrh6Gy9t+dHdnrgXqOZJCxUctMGauc+4tjXH5jh09TYgkskFdtHtGsgalMZwSQuw52ZiUXXA0x3d0cTghQMtOsDQdrvdrWDafKW7Zjl/etYZITAxggWFBenCymUvYujzrS4ENj7o5UBYhr+DdkGgUfvOaLx/PjJ46eaxFFHRB1tL5qYvkyebrKBZ7OLWLWOlf2u1h6hWOe77eCIUepbEz9RSZKH1PnD8EfLBYUE7vMB1ImJfj6UPVXxffgDcsMDwd0YFU03772OaRI4m6RsIx0UnXcWUY7uZWzPHbF+JbObyyh6JqeyGS9DdD+cTE9/masvYWCm4Vhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hL8XK/abinzPMQvoqYIOTJBtOfMB/i/ngXBb+QGCYas=;
 b=cV9F3ALhiGX7wJxiBuRnIms1l9zgIiR1jd2uGn0PsIPkA9Txfv7yWUwwZorGKyCn2Wf1HWnm+krMrzcYgK0XFeNDiMOjms8Ba7Dh0UdR5KPdcRvp19DbYujSZM/TRBge1bkFxi60IS+TLi+3P/lk5yv+ldxHg1PDX5nAlCl7qsERzMmQdVPVciIK4gN1cCY61bDIbX4OFtH6s1q8ZswNdAH27s/bdPq5caIyaFzNs2zZIQdQt/fvrPIMD5u2oi25SEmquH+XSVCey1BZ+u3tPysd2aK6lY4FVFfmyaY8ApHFuQHbxttjw6ITjWq/Ov6Y9kJrSx2xtPcJ6+Cmaemocg==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by TY0PR06MB5469.apcprd06.prod.outlook.com (2603:1096:400:27f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 15:16:20 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19%4]) with mapi id 15.20.9769.015; Thu, 2 Apr 2026
 15:16:20 +0000
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
Thread-Index: AQHcwPj8g7NVaZWW6EuCuBxZg6FVg7XKNmaAgAExa8qAAFOAgIAAHT1T
Date: Thu, 2 Apr 2026 15:16:19 +0000
Message-ID: <OSQPR06MB7252D6AB2B8E8BE5DCF39DFC8B51A@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20260331-i3c-hci-dma-v1-1-e5cd295c44ff@aspeedtech.com>
 <ad7cd33b-3424-4532-b38e-f8f9c5ee1ad5@intel.com>
 <OSQPR06MB7252F5318D15701533E5058D8B51A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <ebff1eef-7c73-4bc4-a15d-7ed796531965@intel.com>
In-Reply-To: <ebff1eef-7c73-4bc4-a15d-7ed796531965@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|TY0PR06MB5469:EE_
x-ms-office365-filtering-correlation-id: c754fb22-8cf2-4cc3-5384-08de90cacb26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: XqzdhHi6S6OMG3ZdDmP7JXDh37GZNopDHJ/oECr/JT45i/5as7zLoPC/eVrEiNciLw0E9DDkHd66LmDGBGJXiMde6rQDyRmBhFn2MpZ7byZXgA4YC+YZ7wBfRvSsQ7AnfqL4+NAH3fRe1rfKCEJzQAeVq8vSPTbobuAvDuEd1/60j+IG7WZjer081ulOL7w363mtjAu9q1aZsLuTlNJlfXtyllMPlLBetaunDXsXXXAySeritVpwDP8x7q4s/y8xIT3m+Q6h0BLwVDg3pLwoYOdKFuJZcpbvHITFuB7//fQDjX3cFo3N8jm8ZB4QxCmeDc9Fe4J+V6fS7DZIYMFXNR0cMvME5it1W5xWfkeeBwYjouO+Mf6CA0TgLMf64DL+h/Bcwqeif9Kx2y/LYG2vi457vEK82jO0A4DhFgLVDqCXhwbz/qso0VNg8X5z1s4UxpSxtLbsis+2fKBwMMvuJOWLmj5yzAxgOggAph7VghQGYcGuheEmwvbSjZN/JXogU9frI5ucyRW4UTdvlNGGTRy0kbtnzHjst10qpl3WTGCm/rSrp5aQ1avXhr/GoT2fVhqfKxzbCW9DxwYDDk5WT9quKxKeCJakzkYJWKPpqR93I+NcjHPeS8mmoyFw8AWaFiJ6eXydUrzVCNDl1QE//fWG7cajfhhUhWq5My5QGYgLOQfmvq1j1AvX5wkNS06W0PKOXJmO//EWYAZtqgW/wukTkiHD+X9yuugt+pase0pwZZnChclzaGidabcDkvJMhRsxfJsZJ/sOi/CtQ4ueO6JLGbqWt+1v58W7gz/AzNU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?Vyy0u2+qP82DjhDajVF6V5SbcJHDVNNDxT//w5HcNtRkCcOUUGYO1v9W?=
 =?Windows-1252?Q?KEy3TP2yk06Y1MkPgmCxjzmABtlLHYuABUtn8AcBjfE6bAlUv7z7cFd5?=
 =?Windows-1252?Q?4WkikCThteD0oy7q+HcN1NTP/9BHlDPi4iuJ1baDgxaQNVycUJIB1EXQ?=
 =?Windows-1252?Q?BobXNxEavGFaEL8azRf/8++ARdGGMoT2n4Clb8irlK8MbI68B8tDOhJD?=
 =?Windows-1252?Q?WrPT1Rn9vl35JGLiWR0vePLFQKJNQU098naRQdxpSNeeFDVrsamL/Gvs?=
 =?Windows-1252?Q?RjqelY1QLHLaJfiIkDr85frvsbVGtnXTl58twN2q3QHCpn1zzhv9Dvtw?=
 =?Windows-1252?Q?Xx1N9vKDopzn1MQP5LFC2HSUEGDU6y16tIm1u+JclmroXcnvGQJgL5Db?=
 =?Windows-1252?Q?myEfVdJLocinPj5a9ScQP7GDErO5YFrVEV24xxlv8wz5aARAmejZ7tO5?=
 =?Windows-1252?Q?su/hU5wG+fJfU7WaNImlpSu77U9wQRpz2+aFlV9HJCwDh7T6R/0ilhOk?=
 =?Windows-1252?Q?U/c7nD4Md7ezVM+Iz9v92GxRkU3oN8loNs3s2oos/9GulT0Fhg5e71Pz?=
 =?Windows-1252?Q?wBewo4n1qhdpSOux5rHeZHlJgZfbl3i47yhsNEcykvie2DXGs31xtxRY?=
 =?Windows-1252?Q?dWJngJgz7Q1pQvkDspvLqUiV2nerQA8GuIdNqKqLnqMW2G/TKbgp5wBI?=
 =?Windows-1252?Q?Eg816xJSDyaswaNUK5mEROfzgQZYkbCb+judWf920upKd02lUrLxaew8?=
 =?Windows-1252?Q?xOPSp85/Btvo2eUagVrTHC6mwJyJrc7Ho7jJRpWMB1w44gys1AXD+Ntn?=
 =?Windows-1252?Q?9NX78vRnkMmLRAItTQqpLbn4Y14bXM9qG99DreWre68AgfYeDsnPy6GJ?=
 =?Windows-1252?Q?DJiGlfzm+R7rcaLUMEg6q1SpiyrF15v2EE1TSWuj62eP6lAA9tZGKptY?=
 =?Windows-1252?Q?Wjrq4UIOcDxG67SsKijWMSfyS754Sso01ZRSm9Q9X1AZbxIuRQ5iPmrO?=
 =?Windows-1252?Q?3PB+zuOFYIfWqXKc5WxvQTHZ9MHeHvBfVDWYgjeoiQSScdJ9Qs2Anheh?=
 =?Windows-1252?Q?BmkQ8pqiy30+4L2o2mgPSYAYA+MD9oEEmLW7Pm6hrtJMch6wUuwB71GT?=
 =?Windows-1252?Q?sebhEhA4+wgOaMK1i+0YiicWLk7QusWKlW8iHg6BOjTyFu4KiQRIOfYW?=
 =?Windows-1252?Q?gP4qqDI9j9GNvC3IWfvHN8kQxdUjptoNdev8BSmFBuypR5ps2Mzyjb6o?=
 =?Windows-1252?Q?7DnEFCwJADAhMkQ1Lztli+fNIsy+b3XZjn1Jaxwv9vw5KyRbJfqiSiFE?=
 =?Windows-1252?Q?SEin/Q+TnKI4jHnoGe0rGGBQQgvSVXzO+189cPZQ79KMiliJmjC1jpQP?=
 =?Windows-1252?Q?iqCwt9hVG6byDGKfWgd8SuKbe9B8wDmuy0yQsZrG93w48iTFvBa/EcUx?=
 =?Windows-1252?Q?YuB6UsyFXvzyFdXqgrOxnHH/5X/NRwR6sscO+9OURivihPAu9kJdoSRL?=
 =?Windows-1252?Q?z1j7GaCsCRrYSIWGjSaBUMITEiJvSAluOHWC7EoKpqQ+8f8wDxewtrLP?=
 =?Windows-1252?Q?fbNmf/FIfqUGziDaM2/LEzcHuok9iBtEuwsl5lJmuqNXgnOrQMeqm/Dx?=
 =?Windows-1252?Q?QkiUnKEkOWGkzGt540FmG3P2/sUYWB5pDr/vLi1F86tRYOMjexPjEfby?=
 =?Windows-1252?Q?agF7/49RzyW4md4gtMQ1JqgQq597ZF26ZXJHaZwLfdBCHyViZDXk4ONP?=
 =?Windows-1252?Q?lcJZz/0SceHS1Oj9sjnTp7kpu1k3qtAnV78MWgzu8EFvDzGvCbqWW+GR?=
 =?Windows-1252?Q?FLr/KRUOb+tuXY6WEs3XGSBiPs3IVXe1faeItRj0hnZulV0Aop+fbIUZ?=
 =?Windows-1252?Q?iLwgVuzZ4cvifw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c754fb22-8cf2-4cc3-5384-08de90cacb26
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 15:16:19.8740
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RBwaH2HHn9X2ZLOCf+jJ3UvM//RKG7LNwZ/kaiepwo+wXqnUg2a7/iidcCagDgL2g1D7fE3hJpM1GrXi5TGRXjCu6EnmcZshrEgyKFelBxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5469
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_081626_644840_7BB18DD3 
X-CRM114-Status: GOOD (  15.00  )
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


>>>> In DMA mode, the IBI status descriptor encodes the payload using
>>>> CHUNKS (number of chunks) and DATA_LENGTH (valid bytes in the last
>>>> chunk). All preceding chunks are implicitly full-sized.
>>>>
>>>> The current code accumulates full chunk sizes for non-final status
>>>> descriptors, but for the final status descriptor it only adds
>>>> DATA_LENGTH. This ignores the contribution of the preceding full
>>>> chunks described by the same final status entry.
>>>>
>>>> As a result, the computed IBI payload length is truncated whenever
>>>> the final status spans multiple chunks. For example, with a chunk
>>>> size of 4 bytes, CHUNKS=3D2 and DATA_LENGTH=3D1 should result in a tot=
al
>>>> payload size of 5 bytes, but the current code reports only 1 byte.
>>>>
>>>> Fix the calculation by adding the size of (CHUNKS - 1) full chunks
>>>> plus DATA_LENGTH for the last chunk.
>>>>
>>>> Fixes: 9ad9a52cce28 ("i3c/master: introduce the mipi-i3c-hci driver")
>>>> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
>>>> ---
>>>>  drivers/i3c/master/mipi-i3c-hci/dma.c | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/maste=
r/mipi-i3c-hci/dma.c
>>>> index b903a2da1fd1..f4c76f168276 100644
>>>> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
>>>> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
>>>> @@ -721,6 +721,7 @@ static void hci_dma_process_ibi(struct i3c_hci *hc=
i, struct hci_rh_data *rh)
>>>>               if (!(ibi_status & IBI_LAST_STATUS)) {
>>>>                       ibi_size +=3D chunks * rh->ibi_chunk_sz;
>>>>               } else {
>>>> +                     ibi_size +=3D (chunks - 1) * rh->ibi_chunk_sz;
>>
>>> That assumes chunks is not 0.  It would be better to
>>> defend against that possibility i.e.
>>>
>>>                         if (chunks) {
>>>                                 ibi_size +=3D (chunks - 1) * rh->ibi_ch=
unk_sz;
>>>                                 ibi_size +=3D FIELD_GET(IBI_DATA_LENGTH=
, ibi_status);
>>>                         }
>>>
>>
>> As expected, the value should never be 0, as this is guaranteed by the h=
ardware.

> Not sure the spec. actually says that anywhere.

Apologies=97this assumption is too strong. I overlooked the IBI condition w=
hen no data
is present. It may be implicitly understood that the CHUNKS field should be=
 set to 0.

> >
> > If we add a check for 0, it may be appropriate to include a WARN_ON mes=
sage to
> > indicate unexpected hardware behavior.

> Please no.  If the target driver does not get the amount of data
> it is expecting, then it can complain.

Got it. I will update the code to handle the case of 0 chunks without addin=
g a WARN_ON message.

Best regards,
Billy Tsai
-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
