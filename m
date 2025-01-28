Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845E6C02193
	for <linux-i3c@archiver.kernel.org>; Wed, 29 Jan 2025 20:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=miHsDTFICarW/FUtypp7ePVyluZGS7dNXrSrR86cpG0=; b=ElrxVIeJ9k+IL3pHdrdaSIuD2w
	6jb1Vk1yHgBCURDFhuaWUlbzV41zTOed7aYd3EvYNP8WjPULZ9UHRmDpfOaRnrYkPVAMlyyCqCog6
	m/TlfCynnAScYXKeKe7r9Bz7LOf1XAh1Oq4BqdfNsvmlJtb0rTrM3AMsOxYrm8GweXhEBU3jliPh/
	2eRhVICpyuUWY7qWhTtyNXV1xGi2z/XuvYABsoOiHL70x5cItApckNi1KA8H7/xIzOT8rMozFCVvL
	3a+M1cYrr6TRAGzNDrDGwYqTa5Lc0q0NbvuFZDJDSjFtsfu9c8pHwxtCARWATBWx6rMiscxAiEQmN
	cjnwDsIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdElw-00000007lSN-18cp;
	Wed, 29 Jan 2025 20:34:52 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tclLz-00000004vvp-2SiH
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jan 2025 13:10:09 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2f43d17b0e3so9794756a91.0
        for <linux-i3c@lists.infradead.org>; Tue, 28 Jan 2025 05:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucla-edu.20230601.gappssmtp.com; s=20230601; t=1738069806; x=1738674606; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOCE/EHkpCoKrKjffslP9jwtGrP2mva2YP7SdD8IH90=;
        b=1hQ+L0LfGjBuj+XSOvep9cndIq/QKCwNU2FzF+78wvGzZWxYMFnPnyoNMQQqPjTEpp
         fg4TXzi3RvxdQFudRlal6fZQ4cP5tg3Ms3E+/oC/YYioDeHQNQauajBM3NJWHeEds25s
         pmqKmojKvFvtoktIZgaPDC3uoZRI1Get00AWJrKOWCxvoo/1IytFVzHAHOLl3r8+rKfE
         bkVSMWS215KY05SomfjACPxXYRNt7z+gCFtX+v0A9fepu1SIgVZF2/D5fB9uVrAJZQth
         bGPFAvHeDk093hwVish36BHdLsrvXhOId92H+1kyc6HeBj58vbAHWvjhGvplXaoPKj8y
         IneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738069806; x=1738674606;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eOCE/EHkpCoKrKjffslP9jwtGrP2mva2YP7SdD8IH90=;
        b=FObdG79SYNxMAdVR9dbAoFG0fFYi4KpGlO353v5VC87rcQskIDo0qsF5V7ELWXQRAd
         wpaaIWvKhCHxl274YvLzD9W/VNWK+4aY2E9RL4rIOdnSgWMJeYEtDZBigmGi2iHy1lhd
         0Y3bpaXIAuzP1YkkNYg8sA85uAsEYGKh038RoVaREqHquEjMqroyC5LqJu99g/WnAkQB
         UDvZHluFxa27okKbz6ZGa0ttXH7oFzG4qsZIFRg1xSAoXtVwsgo4ZrWW8njF4w0s7QOP
         MPXn3vpxCzQVxF4PydX4vCnjDqUBmm08w6FG45lWI7qLf3oYuzw8DWoRqTdKntKGd4c7
         nqzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlnSElgvKxahMIDkRFwHDFXfaDS/8RYHXP1tpgez1020fq6zanB3QVFY3e6ZTrmvhi5TIGlxsNpaI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwjNHsKc8HU7MrjLmHHqHyW4vUOs2GyvWI2opiz5PKAG36sYos4
	TNd/wscDrMw8M9LK+xRUz/pZEQRCw4J6IwfH40zW813d7aYOVuyG4MTvJze1V0gRikl2zqmnYDM
	n3KYqV6VvrY0W51+iBAek0UiX6wQ=
X-Gm-Gg: ASbGnctIkq220wdtSwKB643vdlHwMmk3Jci/U4tRoHlqxKNIgXvLQBqPAod4Vuz4rj0
	fN//OKARZYdTaY6pZlmG2a/QeNU0c1ok7vKgiH1ZrbmpDTM/MDGcX7c2Fdp1wYV675mFSmVM=
X-Google-Smtp-Source: AGHT+IGq1BQZlpLc+CvZtxDUQ+7vPprEVzPNA1d0MyWaN/4D01igismyTzTXS0V3Z/mXOS4PSTdMSpcc87fhUGayM/4=
X-Received: by 2002:a05:6a00:ad8a:b0:725:8b00:167e with SMTP id
 d2e1a72fcca58-72dafb714eamr60833180b3a.16.1738069806277; Tue, 28 Jan 2025
 05:10:06 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Jan 2025 05:10:05 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Jan 2025 05:10:05 -0800
From: Linus Arver <linus@ucla.edu>
In-Reply-To: <Z5dtxESPVtg2Ba2J@ninjato>
References: <20250125130320.38232-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWmE2UiE7kwAyQKONSE_ytrNux+Wwu-v__K=jjpAutxqw@mail.gmail.com>
 <Z5Z06WowFspmXby9@thinkpad> <Z5dtxESPVtg2Ba2J@ninjato>
MIME-Version: 1.0
Date: Tue, 28 Jan 2025 05:10:05 -0800
X-Gm-Features: AWEUYZm38Z474eKpjhMRIXEFk36nkeAzhfIviQ5oE56LTDugmpHo-AfJPm2G3_I
Message-ID: <CAMo6p=E8R=jm81eLuSOvCg+F_bgWTu2vK7PmajHurmaFJkvg1w@mail.gmail.com>
Subject: Re: [PATCH] bitops: use safer link explaining the algorithm
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Yury Norov <yury.norov@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-renesas-soc@vger.kernel.org, 
	linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Kuan-Wei Chiu <visitorckw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_051007_790051_F157543F 
X-CRM114-Status: GOOD (  11.05  )
X-Mailman-Approved-At: Wed, 29 Jan 2025 12:34:46 -0800
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

SGVsbG8gV29sZnJhbSwgZnVubG9vcC5vcmcgb3duZXIvYXV0aG9yIGhlcmUgKGFsc28sIHRoYW5r
cyBHZWVydCBmb3IKQ0MnaW5nIG1lKS4KCldvbGZyYW0gU2FuZyA8d3NhK3JlbmVzYXNAc2FuZy1l
bmdpbmVlcmluZy5jb20+IHdyaXRlczoKCj4+IElmIHlvdSBndXlzIGZlZWwgdGhhdCB5b3UgY2Fu
IGV4cGxhaW4gdGhlIGFsZ29yaXRobSB5b3UncmUgZW1wbG95aW5nCj4+IGluIGEgaGFsZi1WR0Et
c2NyZWVuIGNvbW1lbnQsIGl0IHdvdWxkIGJlIHRoZSBiZXN0IGNob2ljZSwgYW5kIHRoYXQncwo+
PiBlbm91Z2guCj4KPiBJIGFncmVlIHRoYXQgaW4ta2VybmVsIHdvdWxkIGJlIHN1cGVyLWdyZWF0
IHRvIGhhdmUuIE9uIHRoZSBvdGhlciBoYW5kLAo+IEkgZXNwZWNpYWxseSBsaWtlZCB0aGUgKmRl
dGFpbGVkKiBleHBsYW5hdGlvbiBvZiBkaWZmZXJlbnQgYXBwcm9hY2hlcyBvbgo+IHRoaXMgd2Vi
c2l0ZS4gV2hpY2ggaXMgaGVscGZ1bCBmb3IgdXNlcnMgd29uZGVyaW5nIGlmIHRoZXkgY2FuIHVz
ZSB0aGUKPiBuZXcgZ2VuZXJpYyBoZWxwZXIgZXZlbiB0aG91Z2ggdGhlIGFsZ29yaXRobSB0aGV5
IHdhbnQgdG8gcmVwbGFjZSBsb29rcwo+IGRpZmZlcmVudC4gWWV0LCB0aGlzIGlzIG5vdCBoYWxm
IGEgVkdBLXNjcmVlbi4KCkknbSBnbGFkIHlvdSBmb3VuZCBpdCB1c2VmdWwhCgo+PiBJZiBpdCdz
IGltcG9zc2libGUgb3IgeW91IHRoaW5rIHRoYXQgZXh0ZXJuYWwgcmVmZXJlbmNlIGlzIHJlYWxs
eSBuZWVkZWQsCj4+IEkgdHJ1c3QgeW91LiBCdXQgcGxlYXNlIHJlZmVyIHRoZSBvcmlnaW5hbCBz
b3VyY2UuIEluIHRoaXMgY2FzZSwgaXQnczoKPj4KPj4gICAgICAgICBXYXJyZW4sIEguIFMuICgy
MDEzKS4gSGFja2Vy4oCZcyBEZWxpZ2h0ICgybmQgZWQpLCBwYWdlIDk3Lgo+Cj4gSSBkZWNpZGVk
IGFnYWluc3QgdGhpcyByZWZlcmVuY2UuIEl0IGlzIGEgZ3JlYXQgYm9vaywgYnV0IHdoeSBwYXkg
YnVja3MKPiB3aGVuIHRoZXJlIGlzIGZyZWVseSBhdmFpbGFibGUgaW5mb3JtYXRpb24gZm9yIGp1
c3QgdGhpcyBvbmUgdG9waWMuCj4gQmVzaWRlcywgdGhlIGJvb2sgaXMgYSBjb2xsZWN0aW9uIG9m
IGFsZ29yaXRobXMgYW5kIHJlZmVyZW5jZXMgb3RoZXIKPiBzb3VyY2VzIGZvciB0aGlzIGltcGxl
bWVudGF0aW9uIGFzIHdlbGwuIE1heWJlIGFzIGEgc2Vjb25kIHJlZmVyZW5jZT8KCkFkZGluZyBh
cyBhIHNlY29uZCByZWZlcmVuY2Ugc291bmRzIGxpa2UgYSBnb29kIGlkZWEgdG8gbWUuIFlvdSBj
b3VsZAphbHNvIGFkZCB0aGUgSVNCTiBudW1iZXIgb2YgdGhlIGJvb2ssIGFsdGhvdWdoIG1heWJl
IHRoYXQncyBvdmVya2lsbC4KCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtaTNjCg==
