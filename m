Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99040CAC599
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Sep 2025 09:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S/AMHeuqIfL/BWjNEGFfS7AedxXacRtlo2Rwo08IIWc=; b=IeOqKT8TuOmrut
	Nsd7vS6oq9W3oE77LUHA6u9l0eWyTpgwPgSv9gP40I8h73xpOtsHSJYcZ6FX/JwYE7uPIukiG5aH5
	i7NDWrDpxUqm+Ta9t3md6+XQtr4NPdbHf+/2wZd8aeCwt0otqGbOUqhqP4azNYfPCjn9n9Kw8e6Ck
	HFkVSXQ6/4N5QJ32/QJCzE3gS3HXU/1l42D4AkNF/O7XkYB7od/nZzGjHJHCGftWqG7EQOSJBfzq9
	+MtFrTG6cW+cXVRAhcr+5UnPfm/Ey0K6xDf9ixp2cSgzygsoA+34qbL5pD0Px8q0cQL2oA3Sp9XOZ
	OHZvPa4dpxqUL1YZPaRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyS2G-00000007Nym-1cKK;
	Tue, 16 Sep 2025 09:31:40 +0000
Received: from mail-mw2nam12on2071e.outbound.protection.outlook.com ([2a01:111:f403:200a::71e] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyS2E-00000007Nxc-12EW
	for linux-i3c@lists.infradead.org;
	Tue, 16 Sep 2025 09:31:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cp0k2Za8o+M2PEIx1ZRR46c2l+puHnKrEN36PXT4FhCrlhTZig0hWOc810BvmDzPioFufg1pOKLr14E9/57J6Iuec3AlTyiY+5c1juexgsHoK+scjtl2w+AJQ+ks5+gbe96p8DjbC/j1y9snrt2hg/QNiXGkBvNJmtHj2TnwgDvHigNYDYx1qUWbWmJHioneu2CimDvplZW7gfGDma8Jw3ng53wOdQPhviZlsYO53F97EnYVA1m1pzbKVh8uGM76HdIJIxklY1miJU3pU6OtqsLcmQTXNocB4z45sGJ3o0QnZw5dWO4STWh8mz0D1I9EOSrojmqfPz1pi0sbCrs9lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HryjpVjVpAn2tKoJaZ2WX9HnUuHUG2yohnqvOH3JW0A=;
 b=Wz5DN/SP+noIna88IGxPGb118Pvncb7HAx7i/6HAjNhq8T46MzkIUXixeJ1ApbogKZhpUwA62wcEX+N9sRULdNqFgwGpj/Nui7WlY21BXxE2fLr/iVOtV7ycTmtlPFQjPC/sV1GiIVwOmh8qcP9DlT6djSOjWgRCd5+oemGG03SN21jhIuPyHMvxSjYiE+ZfLC9mOHWoU7HeGyEb7nQOI19dh6Ew3yYNPO2zuzqRWNZXCWZGmQ+MnehiS5rZJcuahloJZGGMbyhKwTTL909ijrMkTFdi1rnU3Fh6eaIiIv4teVzI0np2dwDxW/ub3GKNAfLkUaozx4xEMCNcDsJZxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HryjpVjVpAn2tKoJaZ2WX9HnUuHUG2yohnqvOH3JW0A=;
 b=FMn57MTeZ+JWlXX5s2YTe8GmtgequU1ddN3DEpqre3zRF8Y5SRFA6+YspxEwtKOhQJWzbqlu2TlzuCIJwftvqXhytl30ElbttbRmOKADYVwh4uNSRFLej0ywaJdZCMBNjARHfgoVTcsOPVTQD3uFvuOuRZyg89N7jQKPg3hNlMv7c25uGgXv/iUNzwQybjlM7ZvR0HTl4Bli2qCqCCNbxr+iPYEObIhyShYOCPiYOfDM2A+wMJmVb3I+w3DD38od87+eLgYmNcGSo+VA5mFQluXokVeDdo8HaMCEubRZ5Yw0uORsj0WTg5yMDA06EH2Js6leXH4OQmyfHvridtEENg==
Received: from DS4PPF71D32B30E.namprd18.prod.outlook.com
 (2603:10b6:f:fc00::aa2) by BY5PR18MB3762.namprd18.prod.outlook.com
 (2603:10b6:a03:252::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 09:31:28 +0000
Received: from DS4PPF71D32B30E.namprd18.prod.outlook.com
 ([fe80::7c46:661:da37:dc33]) by DS4PPF71D32B30E.namprd18.prod.outlook.com
 ([fe80::7c46:661:da37:dc33%7]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 09:31:28 +0000
From: Boris Staletic <bstaletic@axiado.com>
To: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
CC: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"Frank.Li@nxp.com" <Frank.Li@nxp.com>
Subject: RFC: i3c: scanning for i2c client devices on the network
Thread-Topic: RFC: i3c: scanning for i2c client devices on the network
Thread-Index: AQHcIls3B8in9f78u0ufe0uKmtCHyLSVkP9R
Date: Tue, 16 Sep 2025 09:31:28 +0000
Message-ID: <DS4PPF71D32B30EDCD240EF7D57F6746B14DC14A@DS4PPF71D32B30E.namprd18.prod.outlook.com>
References: <DS4PPF71D32B30E58BEEB807E76DA5FF106DC0EA@DS4PPF71D32B30E.namprd18.prod.outlook.com>
In-Reply-To: <DS4PPF71D32B30E58BEEB807E76DA5FF106DC0EA@DS4PPF71D32B30E.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF71D32B30E:EE_|BY5PR18MB3762:EE_
x-ms-office365-filtering-correlation-id: 0e79c72f-cc9c-4e14-7e49-08ddf503d021
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?y9nxYvQ1EtsHQz+Z+v3geI0anDYK4NlFTOmLAUJg6RkKEMvMK3G0NjyArK?=
 =?iso-8859-1?Q?tMy7SOmVUm3jyg1VVj1+kM628CcojaxdsQm76L0owjDvp2bWLrC+d0fFHC?=
 =?iso-8859-1?Q?n4vHn5X4zsOuF6sE8X/OzLuTVsBK2hgEfDDofhjj3KZhHdfpQX2MxFkZFr?=
 =?iso-8859-1?Q?1Ntb85xOfJ8CfR9DfyBkC7/oAthP3kbBUfytCQH4Oq1acts2vc9TU2uXS+?=
 =?iso-8859-1?Q?y8r5MILNbXn8WHNGBwqwJcAIYckszl4rREMdHTjWbdVCZJ8WZqjMIoqINT?=
 =?iso-8859-1?Q?sBFXysXRp0e228YBGLfGWIe/u1Kid/pp7IwUCTMuTJiw3oR7oNR05smtDk?=
 =?iso-8859-1?Q?ZgKwhsILBjlHw3+mSvo5rbrDbjdMLGIIEDM8fHfavgxueef+xqId/8pW+r?=
 =?iso-8859-1?Q?15zUQTp6xOXZl4siJWMqDGvJwo7dSiLVqKsqX0t1RGG+dvHuxan8TJknBK?=
 =?iso-8859-1?Q?gtT7D6SnT7cwlIj0Vv4IeHbqWBUa36mVkLAWfAP62lXRE6c5PbltAGR+IW?=
 =?iso-8859-1?Q?BvTHCVrK4MInKtY2XRV+qzab2vPa64lV9S8nrhyZdUFARN/diCG5CCbKbr?=
 =?iso-8859-1?Q?jnC+ErkNPpX2FK7bd0beMc12XvWOJY4QA4QZPcC41VW3CRLBtmxgxugAnz?=
 =?iso-8859-1?Q?ovi6JN8J0W6n4H+w7kI76l536buhwTNitMDnoD2/TTCSlTC6rB25abGCVh?=
 =?iso-8859-1?Q?oQFeMjdV47dPAPyVYxIRiztFjTLM28VaEKT4JBT+4Dd2L+A1hfLsjq7aMQ?=
 =?iso-8859-1?Q?0nbAZBWJ/eQ9IZJK+9vrEFbipxD6nugtiJ2vlNcZAmArp0I8Iu2Z1NS3bY?=
 =?iso-8859-1?Q?n98DAO/tc1mul5JT9U2zNM+6fMDqdtskeKB+RozD1NjzpyxBnSBzYa41Xu?=
 =?iso-8859-1?Q?NNn0MeSKn7CqZdPwlMH0KcJ1/8JDhnWMmXhAjVT2tblqvf5krj3a8M9HNI?=
 =?iso-8859-1?Q?2YtIpTDQA+9w17DOGTLKdFiTbMnjnYn7rNTD8QQgXpcU4WW7qEFjeSTMo7?=
 =?iso-8859-1?Q?9HuIVnaxi+uNy/BUzYkyuo7E+kVp89xK4xO/d1PDdVdWDxbR/ITMFh/3v8?=
 =?iso-8859-1?Q?d/4tHxxWan6cZtCpuzPD+iyocU2Er26frftO1dy1HY98QSsvNSlbdXvL8+?=
 =?iso-8859-1?Q?RKXe0mdpbAv4uI/5f8VLYU2e3wT0o/UTlcZucjzh7pTZSkR5kqSpu1fBn3?=
 =?iso-8859-1?Q?GktYow2Msjj4kT0o5EXiGgzZXFfeiOQmILnvRI5SDntxN/8iJMd7uuUtuD?=
 =?iso-8859-1?Q?rdHVtVNOGWOCVptrpbp08VkfFK39MNBpevHbOTnAXeQ8ScNS4X+vT2WxxQ?=
 =?iso-8859-1?Q?wf2gC+Bft5amuYGrC7DaEH06kq+su2L3p3+r8LClOm9ctKtjrdXMDvaDhG?=
 =?iso-8859-1?Q?rIOB9TOFmNSP2/YOkcsDosdUcTTYSFqoyNAxY+qgrVAyTxjYQqYZkwA3Kw?=
 =?iso-8859-1?Q?eJI/Mhw/39ytkbTqJFzNBeRo5uLJvkg93qLyLBOsVkE4uv/k4dR29Ql6Qe?=
 =?iso-8859-1?Q?rmnWtPnF5Ln36M5qHcKd6vc4uspZSmccb987a8n7ektA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF71D32B30E.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tWwkJevMBIZxM8ILXlY2YHUWVRuZ/ROTyPbIf5TqLbZnRE2nRmn+PtolvQ?=
 =?iso-8859-1?Q?xDPYpbxpartlJVpSmnOeWnB/oQm0pC9xNRDU6FzEDBBRW8IFnWmU73HvEV?=
 =?iso-8859-1?Q?6vosuSbtdcGq0/qDkVQtwluuBhonlnPry52N1J+R/9R7pGLgplHTuTMcoX?=
 =?iso-8859-1?Q?br+zDyowPn50YL28QJyeQwLvRnyFEWZAyh80kuE9ayPUjICt34RHM1LLX9?=
 =?iso-8859-1?Q?qm/e+dklNKGDEFKZgVHWKU87vdC9jz5+sRdygZU2ZtvJIm8obb9wTaAgv7?=
 =?iso-8859-1?Q?KJsYrFKAD1HHEc5smPT9bmDIjxdOeHqTonm6QDaNJ84hHbwUUUqPoQCGrI?=
 =?iso-8859-1?Q?iI86py8rO9mcIoA1ckRzwXinxuaMsmRUIW6N0qyNMwjL0MDKGTYtVP8NkP?=
 =?iso-8859-1?Q?LBwz+KuWIcqtnuKhtJNSvKtXF3niFwxrjIBhcyqjBayNlZHtm2p9amoio7?=
 =?iso-8859-1?Q?9zRVpAxT7bwro67Wjs390RjNOXG+pxTsQYlfwUU4nt/c2Ano7S3gyb5nCv?=
 =?iso-8859-1?Q?u6c08g2nQ2+I360YxX0hd0E6BJd4Bz2IzR4LR8LESivRrQZNlJ3YyfwSmd?=
 =?iso-8859-1?Q?3nyxpn+GNvIHDxBDW89F0Q2EzMYdw7sTvVrxpK45uYZLFTYO4zkzHj18wl?=
 =?iso-8859-1?Q?QUGyULQIrcaXFsWiMpIUDKpNniXtSkOh9k9Pojr0wKtkHSoI6/mWyk2tW4?=
 =?iso-8859-1?Q?hva5l859fP67+iRMy6PHtVDqzY5UHnq/lVv7L6kB9zgxbze/+Gf9lGke+y?=
 =?iso-8859-1?Q?cORxwE08nRyejHrTxtrk/dAkFBNhMn8rLDuRknereM4pvfD4gAwm4991LS?=
 =?iso-8859-1?Q?JGAGx+WW/lGii0Q3y58Hhq2GS4iykoCWGGN2sMx9LVuk4KwvBXa48b4knP?=
 =?iso-8859-1?Q?hJWWr8QnmyjXZ1RCwY/qlIXYQU22WEwH2i7e5XuH6FFRw6RuVAKLC1qdzx?=
 =?iso-8859-1?Q?NmX7PfLGFjGzEeplahywr2sh1nn35TGhnigO5hwnAxSzgW2Wqh9/TB7F+5?=
 =?iso-8859-1?Q?sV8g9YMCbq4AKJK8rydSZ6Xj1kRuW16GH8Bvj1hYhCNuyyR+QZdjoDdhR2?=
 =?iso-8859-1?Q?K5jtyBwhR6EM1zLN3tUHglM5NpZvQfAh8X62WeNhYxxxw1NKCsb0SAp05r?=
 =?iso-8859-1?Q?/kgNusCpWPlxJcJNb/Q1F33V7pOT0lN+w7zKzZByWSIqHmrrTB5K06+B9S?=
 =?iso-8859-1?Q?qoTkEBsQpXiZLaDcaVjUAC75WK/2MtEj+o569DeT/G1Ntk5EjcC6mxEyoJ?=
 =?iso-8859-1?Q?WrKTwBqbC9g1BgIkfJ0PJswj3YllXrO1CZYEzDKm67fzWVfgmLMjCrBxF2?=
 =?iso-8859-1?Q?H48xblTG/vsaMIBdeehYpTwuzerQLyW+U674n2X9MpnMkA/nYiuD1uP+z/?=
 =?iso-8859-1?Q?EW8mPGBMPQ8vv7wFM569JBdr4cSgzrs8eeZgpmdoe5PJ3IxwXsI8o7Jk1r?=
 =?iso-8859-1?Q?FxhvLJjWHnrES5oLsILjQsqfbH0Wc5APEWMn5ITH2ldewdeJLW2uMcgVXH?=
 =?iso-8859-1?Q?IbQFS4E7WEcWpZ2sN2UbGQ5Q+4I4i1iBO4QtYswfuKXMCL2hxr1WMeKT/a?=
 =?iso-8859-1?Q?gpWAOWy4QGjbDhUyY2AwWVoSFDN0wvFelfa0Zt3BRHoUNVecUx5hS0ql4p?=
 =?iso-8859-1?Q?EYBOyQQCU/01U=3D?=
MIME-Version: 1.0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF71D32B30E.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e79c72f-cc9c-4e14-7e49-08ddf503d021
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2025 09:31:28.1475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rvs/MhNyHRByHHKjxKCJL/6uHFjkDJqQjedXzr3ns25/A255UG4UWkujj+saAsY2J3lcSsYxl5e5ujiE45oV/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3762
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_023138_287179_0EBF7D90 
X-CRM114-Status: GOOD (  12.41  )
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

> Hello,
> =

> We have an I3C bus where the user may ultimately attach an I2C slave with=
 an arbitrary address, with the idea
of using i2c-utils to communicate with the I2C slave from userland.
> =

> With the current kernel, I2C slaves need to be known statically and thus =
i2cdetect fails to detect any slaves.
> All communication attempts get rejected early, because i3c_master_find_i2=
c_dev_by_addr returns NULL and then i3c_master_i2c_adapter_xfer exits with =
ENOENT.
> I3c_master_find_i2c_dev_by_addr returns NULL because bus->devs.i2c ends u=
p being empty.
> =

> Since the I2C drivers have i2c_detect and i3c_master_controller has its o=
wn i2c_adater, I looked into what needs to be done for networks
with I3C masters to use the existing i2c_detect mechanism. That lead me to =
the following list of changes:
> =

> - i3c_master_controllr's i2c_adapter needs to have its class member set.
> - In i2c_detect_address, temp_client->dev needs to be populated and regis=
tered before the call to i2c_default_probe.
> =A0 - Otherwise the attempt to probe gets rejected early, for the same re=
ason described above (i3c_master_find_i2c_dev_by_addr returning NULL).
> =

> That much was enough to get i2c_detect to work with an I3C master.
> To complete the use case I also needed a registered i2c_driver that imple=
ments a simple i2c_driver.detect function.
> In my test, the detect function simply checked whether i2c_smbus_read_byt=
e_data(client, 0) returns a non-error value.
> =

> Could anyone comment whether this is the right approach for implementing =
I2C slave detection with an I3C master?
> The most iffy part of this approach is the need for such a dummy driver, =
just so the I3C master knows that "something exists".
> I'd welcome any sort of feedback.
> =

> Thanks,
> Boris Staletic

Hello,

I just wanted to bump this thread, as any sort of feedback would be greatly=
 appreciated.

Thanks in advance,
Boris Staletic
-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
