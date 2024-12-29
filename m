Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1A5E7719C
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Jan 2025 11:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CT7rnDXIOOPQCQ5hrUDREhPBuVkWibAS/l9uI6kUJbI=; b=JgCZRV0qxiztlu
	JAZZZUBWqNs6Mh3C0fxl+jyLGuuJnnk57k2ZDMuHFUvQ9qXNHA4coF8dfV5Fp02D2BCfpu8A3vHCn
	swACQgxaTgISBp3HyjQzHb+DqOZqGgUTQK/62nd7sbvFGCNREHRP+AKGAwLpD13ZgVCUGgkgtCOjY
	KDX7S4gKGze53INSKPbz1C+Z32FXLKkzm8scp5L0ncGhm9/HA0xroFUS1UFsPXzopI4Qa4WkY+oRg
	MOrChPfJvQGJVXCqSSI7NBE7NvJvF4z1n7cmzpVTiLwAkTb4MWDLCo7MxL3RCj+5h/2JYlUoFvUE0
	9xDRkN/70K/MjjJyJUog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD2x-0000000F5Ra-0t6V;
	Fri, 10 Jan 2025 11:19:23 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRrXn-00000003Kph-0rKz
	for linux-i3c@lists.infradead.org;
	Sun, 29 Dec 2024 11:33:16 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-385e27c75f4so6138393f8f.2
        for <linux-i3c@lists.infradead.org>; Sun, 29 Dec 2024 03:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735471993; x=1736076793; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkndmCp+jPQ8r/fKjpZebPOCIHraDLC2krpRGXtKOvI=;
        b=V//0WBnigWAV+8nYnKCMITRD8bsvLMg5TbYd5p1W3QqGicQoX39dl+MXC9lRLWfrWW
         gDvP5ro8inv3EJNRCvR7nNzBjT8ptpYwovT7GtZJNPFUvIZ7CAUatZxtaeu/lrq+Hme0
         FlzuUvCBiuu0ZT6mGZv6uEMtVXbpfhEEUZmHRWcXBhHdVfRInX/uQWVJFcLbhAXBT27C
         srUCev8RSeI88KvuP/rgFZ9Z04/5eqFL1EVbae6kAzoG1gBX0rFNzhhm4wDS6desVmea
         yU3+OKAw05EBC0NXr+mG11YEGr2vYcoevhdC76ba6mpb53T4e/0ffpZxfDJsCCeofCc9
         du0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735471993; x=1736076793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WkndmCp+jPQ8r/fKjpZebPOCIHraDLC2krpRGXtKOvI=;
        b=SZ27ss+2kSt50RK2Ik8il6BmqpDbmjyGnBJvewnR+xwgV/D8QQEuvEFjmWhB30neOm
         bRH02iFybaNGkb2ivlKnaGQWphzPZhT1J7bwUGYHFzQImFuoujf58oLEHTU8wiYQVJjz
         VVaBOLQAT507e7nugsLjDVebR/y/CncSnbhLQjwL3lfxDmj58KiZfceq+JlG6MHkjNp2
         vC9JyrNsM0iXrFAxYq8oxODgSdysW+HFGNBptCAq3+53LRo93Y1oMnzMWw6jpyWM+5vk
         Qf/tWIIZFeZKGSPaaJEAxGyE0w/D2B0f/NQQKZfudIZ63jWWHSGyb3LuVzpi+v45KJZp
         yC+A==
X-Forwarded-Encrypted: i=1; AJvYcCX2ELWVs4zvXtWihne+pegraS1siwsUmRX6D8Y3AMSEmCZwDCEzRglZ4COUpXT1ssqNUOIJ0cVW2eE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQjJv1p3sI4TkbzOMJxp3Bi+grAc22ByxzS7Z9E6ZYxqg2kNTM
	gJANAyc8bu2hop0zJzL3qUXM1U2JJj8raZ8qepLyqxRHKsEwCJfC
X-Gm-Gg: ASbGncuxKWGPGHtRV136bim2NkEHk/5/01bowvwrNv08Kw8UvUJSSbZhHtmCvYRO4yc
	jCu20zeIn9+vIVVaxNmpGfkI5BhUkPvAs595I7BGUFUvZHdAG2t5OGvpmJDfK0Qm5RbyxJ0daU7
	St1tipd7uKo66eTPr1h6oqB2oUh0kcoND7qdnokOHIxyZsnCyU8AhwfIfUhC7tmguYA2r5QhUi8
	kYBASfieq2w7uzK/w+czvcCj3nUOVpRou9e6Xg2ZzuPF6sU+ZpxWiCL3wz/xflPOVdm0bTeJgTE
	fsh+k4a7jN55n6U+5y8KMiQ=
X-Google-Smtp-Source: AGHT+IFvftzXgl78vEYrm9XPeEnig4E4l73931Fxjl6fUhikR8JH2AY/yECzv08NDXPLb5jTMXlLow==
X-Received: by 2002:a5d:64eb:0:b0:386:3711:ff8c with SMTP id ffacd0b85a97d-38a221f1fddmr24422470f8f.23.1735471993069;
        Sun, 29 Dec 2024 03:33:13 -0800 (PST)
Received: from dsl-u17-10 (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e219sm27517675f8f.84.2024.12.29.03.33.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Dec 2024 03:33:12 -0800 (PST)
Date: Sun, 29 Dec 2024 11:33:11 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, =?UTF-8?B?UHJ6ZW15c8WCYXc=?= Gaj
 <pgaj@cadence.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH RFT v2 5/5] i3c: cdns: use get_parity8 helper instead of
 open coding it
Message-ID: <20241229113311.3b8f70d6@dsl-u17-10>
In-Reply-To: <CAMuHMdWSQvyLwHyci+WVtTj4rGeR-hkjw1ap52=5X29ZzVchSA@mail.gmail.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
	<20241229101234.2896-6-wsa+renesas@sang-engineering.com>
	<CAMuHMdWSQvyLwHyci+WVtTj4rGeR-hkjw1ap52=5X29ZzVchSA@mail.gmail.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_033315_248949_1B7CF04B 
X-CRM114-Status: GOOD (  24.77  )
X-Mailman-Approved-At: Fri, 10 Jan 2025 03:19:21 -0800
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

T24gU3VuLCAyOSBEZWMgMjAyNCAxMTo0OTo1NSArMDEwMApHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToKCj4gSGkgV29sZnJhbSwKPiAKPiBPbiBTdW4sIERl
YyAyOSwgMjAyNCBhdCAxMToxM+KAr0FNIFdvbGZyYW0gU2FuZwo+IDx3c2ErcmVuZXNhc0BzYW5n
LWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cj4gPiBUaGUga2VybmVsIGhhcyBub3cgYSBnZW5lcmlj
IGhlbHBlciBmb3IgZ2V0dGluZyBwYXJpdHkgd2l0aCBlYXNpZXIgdG8KPiA+IHVuZGVyc3RhbmQg
c2VtYW50aWNzLiBNYWtlIHVzZSBvZiBpdC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBXb2xmcmFt
IFNhbmcgPHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tPiAgCj4gCj4gVGhhbmtzIGZv
ciB5b3VyIHBhdGNoIQo+IAo+ID4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL2kzYy1tYXN0ZXIt
Y2Rucy5jCj4gPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvaTNjLW1hc3Rlci1jZG5zLmMKPiA+
IEBAIC04ODksOCArODg5LDcgQEAgc3RhdGljIHUzMiBwcmVwYXJlX3JyMF9kZXZfYWRkcmVzcyh1
MzIgYWRkcikKPiA+ICAgICAgICAgcmV0IHw9IChhZGRyICYgR0VOTUFTSyg5LCA3KSkgPDwgNjsK
PiA+Cj4gPiAgICAgICAgIC8qIFJSMFswXSA9IH5YT1IoYWRkcls2OjBdKSAqLwo+ID4gLSAgICAg
ICBpZiAoIShod2VpZ2h0OChhZGRyICYgMHg3ZikgJiAxKSkKPiA+IC0gICAgICAgICAgICAgICBy
ZXQgfD0gMTsKPiA+ICsgICAgICAgcmV0IHw9IHBhcml0eTgoYWRkciAmIDB4N2YpID8gMCA6IEJJ
VCgwKTsgIAo+IAo+IFBlcmhhcHMga2VlcCB0aGUgaWYoKS1jb25zdHJ1Y3QsIHRvIGJldHRlciBt
YXRjaCB0aGUgZXhhbXBsZSBpbiB0aGUKPiBkb2N1bWVudGF0aW9uIGluIDEvNT8KClRoYXQgbGlu
ZSBpcyBoYXJkIHRvIHJlYWQsIHdpdGggcGFyaXR5OCgpIHJldHVybmluZyAxIGZvciAnb2RkJyBp
dCBjb3VsZCBiZToKCXJldCB8PSBwYXJpdHk4KGFkZHIgJiAweDdmKSBeIDE7CkJ1dDoKCWlmICgh
cGFyaXR5OChhZGRyICYgMHg3ZikpCgkJcmV0IHw9IDE7CmlzIHByb2JhYmx5IGVhc2llciB0byBy
ZWFkLgpCdXQgSSdkIGNoYW5nZSB0aGUgbmFtZSB0byBwYXJpdHk4X29kZCgpIGZvciBjbGFyaXR5
Lgoob3IgX2V2ZW4gYW5kIHJldHVybiAweDgwIGZvciBldmVuKQoKCURhdmlkCgo+IAo+ID4KPiA+
ICAgICAgICAgcmV0dXJuIHJldDsKPiA+ICB9ICAKPiAKPiBHcntvZXRqZSxlZXRpbmd9cywKPiAK
PiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydAo+IAo+IAo+IC0tCj4gR2VlcnQgVXl0dGVy
aG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51
eC1tNjhrLm9yZwo+IAo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwg
cGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKPiB3aGVuIEknbSB0YWxraW5nIHRv
IGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRo
YXQuCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwo+
IAoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNj
Cg==
