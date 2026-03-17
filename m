Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A795CFD8746
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Mar 2026 11:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hty27X/dXT5n942Pnt6CTRCBfNio5WuPg9bqzKaNVLU=; b=azULLw7ymJmr4C
	mKXw9CmUian507yN4iSU3OzE3KSdw5gcndBHanSEPyHvNXFY88I2gSr5rtuY4nBmHVoM2eYdjs8mp
	hp+B5Qg5ptT/0sTZICYeAoMOefoYDzLR43jllnUmMENynuVMkcc/TiQybQVNgXu7Nr5CMQzVA2B1L
	7knAKgzGiQLDKKoTJBoC/9agX+M4tDc3qqX1uYX9K0npckZtZqj3oMvAju5ICWWAlHfe18xjoTZcI
	orYAy9irTIPPRuxlVjFwhzfIgLO9G6bA39kPGvkgqIq1xYNCPAI9TaJN66TAcUgvX1YGlDy7Raj8R
	pbnwk7ET4fP7z1a7RmLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SmG-00000006AGN-1j99;
	Tue, 17 Mar 2026 11:40:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SmD-00000006AFW-3ZrW
	for linux-i3c@lists.infradead.org;
	Tue, 17 Mar 2026 11:39:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 02CEE44293;
	Tue, 17 Mar 2026 11:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C177FC4CEF7;
	Tue, 17 Mar 2026 11:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773747596;
	bh=yozjB9rytWSTgNIxVrVuxEglEsVNstcwA/l28nbozPQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TCMd/cMSdBWPYnakIQdNHVYhHYw+zb9/eGTdjXbXnpwxi7iMcHPHkDMXkGuf7TuGR
	 kAsEpVaZDDuMoqu9D4XrGYo06JSjb4lBhlNg0spTD4jhJUC7ZUb98Q+bFhubUGfqbl
	 oZ4MvyScSpFhHhB+HEluudDXozLZOLvBNiYs96U9Iglmu1rGsow9dm1FR6xSocA9Y3
	 1sGl5wLW9XVdXiUGTZKigHFc9YxNomfty6SlqnZeNXiyarv+FgJpR7h/ZiW1zzwQYQ
	 iupRQnH17VrSNlqcAQCxsmfjsyGCtcpKb/B/Whr+/QFETQGO7iR8qZXoDyBW+2jGpu
	 XqANNA3C+Ty/w==
Message-ID: <64c5070c-aa9e-427a-933e-91e168f0510c@kernel.org>
Date: Tue, 17 Mar 2026 12:39:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v6 3/7] dt-bindings: i3c: Add NXP P3H2x4x
 i3c-hub support
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "lee@kernel.org"
 <lee@kernel.org>, Frank Li <frank.li@nxp.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
 <priyanka.jain@nxp.com>, Aman Kumar Pandey <aman.kumarpandey@nxp.com>
References: <20260310065727.3759342-1-lakshay.piplani@nxp.com>
 <20260310065727.3759342-3-lakshay.piplani@nxp.com>
 <20260311-outrageous-unnatural-jerboa-53f5a8@quoll>
 <AS4PR04MB936254136A4791441EDA2F91FB45A@AS4PR04MB9362.eurprd04.prod.outlook.com>
 <f0960746-e9e8-4a86-8800-31b8a7a29920@kernel.org>
 <AS4PR04MB9362F90E42A990CE0620B992FB41A@AS4PR04MB9362.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <AS4PR04MB9362F90E42A990CE0620B992FB41A@AS4PR04MB9362.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_043957_932586_00A9FE51 
X-CRM114-Status: UNSURE (   8.71  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gMTcvMDMvMjAyNiAxMjozNCwgTGFrc2hheSBQaXBsYW5pIHdyb3RlOgo+PiBLcnp5c3p0b2YK
PiAKPiBIaSBLcnp5c3p0b2YsCj4gCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3Lgo+IAo+IFRvIG1h
a2Ugc3VyZSBJIGFkZHJlc3MgdGhlIGlzc3VlIGNvcnJlY3RseSwgY291bGQgeW91IHBsZWFzZSBz
dWdnZXN0IHdoYXQgc3BlY2lmaWMgY2hhbmdlcyB5b3Ugd291bGQKPiBsaWtlIHRvIHNlZSBpbiB0
aGlzIGR0LWJpbmRpbmc/IEkgd2lsbCB1cGRhdGUgdGhlIHNjaGVtYSBhY2NvcmRpbmdseSBhbmQg
cmXigJFydW4gZHRfYmluZGluZ19jaGVjayB0byAKPiBlbnN1cmUgdGhlIGV4YW1wbGVzIGFuZCBw
cm9wZXJ0aWVzIGFyZSBwcm9wZXJseSB2YWxpZGF0ZWQuCgpSZWFsbHkgSSB0aG91Z2h0IGl0IHdh
cyBvYnZpb3VzLi4uIEkgYXNrZWQgd2hlcmUgaXMgdGhlIGNvbXBhdGlibGUgYW5kCnByb3ZpZGVk
IHlvdSBhcmd1bWVudHMgdGhhdCB3aXRob3V0IGl0IHRoaXMgaXMgdW52ZXJpZmlhYmxlIHNjaGVt
YS4KU29sdXRpb24gaXMgdG8gYWRkIGNvbXBhdGlibGUuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRv
ZgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
