Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3ACC1077603
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Mar 2026 18:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4SfGIN3oTBaGtluFMh4wKh6GlJ66/Du5YIkFcb+dD8g=; b=iUcWCxvDryeX664jmmkqjgUzmw
	cpEF94pYWkFZV1CWiCuCMtArxhpE/bYSCpRAiz5XsLFGuk/OJpXCL/XYv3zPFCF+/+EgxNcbXZOlS
	y1kCE/+F6Z7czdtxe3RdwoIKbYZXf449OuMWicc03RZ1mKhiZ32BD3/lroe7VEwiC/FKaeGe2HBOe
	d8Nv1INRgN8/In6KX2RLkJK4YWbc4atL/OyidWRB/ib0hVlLlgjoyXUMlzXHrTsfjkVeGn39uZQUg
	+MmzN2iWwdSPs3agPNcphB+coxiDQsZ5qvQFZIwgRdAg+n59DrA/JIrf6c+xpOuHBvdP87Tz5uvQd
	zTXjREdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2w1k-00000009ByA-25uy;
	Wed, 18 Mar 2026 18:53:56 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2w1h-00000009BxR-3968
	for linux-i3c@lists.infradead.org;
	Wed, 18 Mar 2026 18:53:55 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-82a655cfab5so266120b3a.1
        for <linux-i3c@lists.infradead.org>; Wed, 18 Mar 2026 11:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773860032; x=1774464832; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=hh3HXSaRNZYrgfFy6kO/5eGwrNgWsuUWpuE42iqN3sY=;
        b=LLl30KkaBBIPHh8Sq83EsK1H0WV13PmGTfV7OtRiX6qBJiw/tBvCdtGE8Wc4AzqAwo
         g3H4Ps0mTbw0XFFw3WjRU3OZnNOZK6oBT6lWnrHsfMU4TGV1atUPrY3MpvWi3beaCQui
         CYMakeHCp1/mn7WCM1hVA66yBAXBdlajQAJEWtLABVp23bOyH/JQ7xSQ7iSuiAy8zKhB
         qtmw8eLcSH7/YPyOyucWBAioA8mmPvAs+tTa3L7AYRGBlPJgIqq2RFvXgzFazjRVrI7J
         F8xKfY3KJIcRNbUh2TC+TORhQwxowr3W5jLkq67JzyDY/TT3ZzPrvbDu8y/4yKpI2U9Y
         s8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773860032; x=1774464832;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hh3HXSaRNZYrgfFy6kO/5eGwrNgWsuUWpuE42iqN3sY=;
        b=NCSzPmS980Yv/Dsdqb3CoY4wIww0wHH/L6ew/fkB6BeEa1KWnpvCBY+bFChazJeG4y
         YYxzZHO5g/UYZiePCqrTtm4f7IbHevVY0d7PGc6EQRBmz0Ku3pY/WUuSETQtIxkxxdko
         p5/0L9vRXEc7XskQtlW1fz0vluEOtuP6u2tm4R9XdzAnN8ZOfmOgMB0mCB8Eq0he47j0
         pvl/1/UfuYW+SVscM63cGzYaWWinb2B9XaO/W8UPtyeArxDqQ8xLwDNoWIvoxahZv6Mc
         2KqbLiq91FyWzIa+tIAQUS2kU5fbUbGNxqRd3aBVYn8aAZGyU7jqvypStPvrlLfdcxTj
         8cTg==
X-Forwarded-Encrypted: i=1; AJvYcCV/Ug1m3owlYnCdE32F0kTQwUHBwusgr8Oiu0m32XeF50N9Q4amK60bDry3A8+JrakFxWA5p6kc0jo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxcDQHFc5gOoBEVf3Cx4heoShpnaKFEviOyvdRv35umVU+p70WZ
	wPwcrj58mrbFtIf7iNm8VKODO91FLPLN4MTZ4oIY5FWAcJF8sMgTNlPx
X-Gm-Gg: ATEYQzxZegZptbkrCvJMxXhATN8lWZvioMzkxrhHym//co9Af1jRZWkrFyeXOwib9R5
	bhKZ2fokRNOnziDrQ1pmRrz/5mgwz1jFACyfrjc9A5xgvMD/uSBNVik+uRmjqNbvN5mBhlUMywS
	62/hMfQ7ume+fK4B4Cj9BXJAFykt43KrOWwU8oKwQTIkvHwnKqWZrqo78UUfTsAunyEGohnpwRE
	owa5iGs7AMiumb+ijLQQ+vl2iszVa2kKTpE5eVIJBmboe1pOfArK2JuCUFCIYf3Le0eEZ8LPdm0
	dQUeTbxe+MJWEl4RMkCNEhfUnH9Lmk7Vgz5czKOEv30fFCo6ktCX+UcnSRTMT+UwZZY4yxcn1f+
	b+7bbAbXh3DBWRrd0n6aa6mxW4wSOh62Ta5BQo/qUx1WasUW42cHDrv75GX5xwyhEZEx60SRMMr
	jwaMUtZlMXBrT+Tsj70HLNOYCM4sckKLbny5ftkro1XEfnN43WmQW+eIfsMszMgt+/1kQaDfHes
	Pted9eKpLo=
X-Received: by 2002:a05:6a00:3698:b0:824:9848:b020 with SMTP id d2e1a72fcca58-82a6b26e7a3mr3958271b3a.52.1773860032113;
        Wed, 18 Mar 2026 11:53:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6af06bd7sm3517633b3a.0.2026.03.18.11.53.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 11:53:51 -0700 (PDT)
Message-ID: <df8086b1-8834-4bf2-ac4b-cb921beb8471@roeck-us.net>
Date: Wed, 18 Mar 2026 11:53:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] hwmon: spd5118: Add I3C support
To: Akhil R <akhilrajeev@nvidia.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Eric Biggers <ebiggers@kernel.org>,
 Fredrik Markstrom <fredrik.markstrom@est.tech>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thierry Reding <thierry.reding@kernel.org>, Jon Hunter
 <jonathanh@nvidia.com>, Suresh Mangipudi <smangipudi@nvidia.com>,
 linux-tegra@vger.kernel.org, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
 linux-hwmon@vger.kernel.org
References: <20260318172820.13771-1-akhilrajeev@nvidia.com>
 <20260318172820.13771-12-akhilrajeev@nvidia.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260318172820.13771-12-akhilrajeev@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_115353_802149_35E16D52 
X-CRM114-Status: GOOD (  31.02  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gMy8xOC8yNiAxMDoyNywgQWtoaWwgUiB3cm90ZToKPiBBZGQgYSByZWdtYXAgY29uZmlnIGFu
ZCBhIHByb2JlIGZ1bmN0aW9uIHRvIHN1cHBvcnQgZm9yIEkzQyBiYXNlZAo+IGNvbW11bmljYXRp
b24gdG8gU1BENTExOCBkZXZpY2VzLgo+IAo+IE9uIGFuIEkzQyBidXMsIFNQRDUxMTggYXJlIGVu
dW1lcmF0ZWQgdmlhIFNFVEFBU0EgYW5kIGFsd2F5cyByZXF1aXJlIGFuCj4gQUNQSSBvciBkZXZp
Y2UgdHJlZSBlbnRyeS4gVGhlIGRldmljZSBtYXRjaGluZyBpcyBoZW5jZSB0aHJvdWdoIHRoZSBP
Rgo+IG1hdGNoIHRhYmxlcyBvbmx5IGFuZCBkbyBub3QgbmVlZCBhbiBJM0MgY2xhc3MgbWF0Y2gg
dGFibGUuIFRoZSBkZXZpY2UKPiBpZGVudGl0eSBpcyB2ZXJpZmllZCBpbiB0aGUgdHlwZSByZWdp
c3RlcnMgYmVmb3JlIHByb2NlZWRpbmcgdG8gdGhlCj4gY29tbW9uIHByb2JlIGZ1bmN0aW9uLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEFraGlsIFIgPGFraGlscmFqZWV2QG52aWRpYS5jb20+Cj4gLS0t
Cj4gICBkcml2ZXJzL2h3bW9uL0tjb25maWcgICB8ICA3ICsrKy0tCj4gICBkcml2ZXJzL2h3bW9u
L3NwZDUxMTguYyB8IDY2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
Cj4gICAyIGZpbGVzIGNoYW5nZWQsIDcwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHdtb24vS2NvbmZpZyBiL2RyaXZlcnMvaHdtb24vS2Nv
bmZpZwo+IGluZGV4IDhhZjgwZTE3ZDI1ZS4uMjM2MDRjMDVhZDIyIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvaHdtb24vS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvaHdtb24vS2NvbmZpZwo+IEBAIC0y
MzAwLDEwICsyMzAwLDEzIEBAIGNvbmZpZyBTRU5TT1JTX1NQRDUxMTgKPiAgIAl0cmlzdGF0ZSAi
U1BENTExOCBDb21wbGlhbnQgVGVtcGVyYXR1cmUgU2Vuc29ycyIKPiAgIAlkZXBlbmRzIG9uIEky
Qwo+ICAgCXNlbGVjdCBSRUdNQVBfSTJDCgpJIGFsc28gaGFkCglkZXBlbmRzIG9uIEkzQyB8fCBJ
M0M9bgppbiBteSB2ZXJzaW9uIGF0CgpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2pl
Y3QvbGludXgtaHdtb24vcGF0Y2gvMjAyNTA0MTkxNjEzNTYuMjUyODk4Ni02LWxpbnV4QHJvZWNr
LXVzLm5ldC8KCndoaWNoIEkgZ3Vlc3MgbWF0Y2hlcyB0aGUgbW9yZSByZWNlbnQgImRlcGVuZHMg
b24gSTNDX09SX0kyQyIuCgo+ICsJc2VsZWN0IFJFR01BUF9JM0MgaWYgSTNDCj4gICAJaGVscAo+
ICAgCSAgSWYgeW91IHNheSB5ZXMgaGVyZSB5b3UgZ2V0IHN1cHBvcnQgZm9yIFNQRDUxMTggKEpF
REVDIEpFU0QzMDApCj4gLQkgIGNvbXBsaWFudCB0ZW1wZXJhdHVyZSBzZW5zb3JzLiBTdWNoIHNl
bnNvcnMgYXJlIGZvdW5kIG9uIEREUjUgbWVtb3J5Cj4gLQkgIG1vZHVsZXMuCj4gKwkgIGNvbXBs
aWFudCB0ZW1wZXJhdHVyZSBzZW5zb3JzIHVzaW5nIEkyQyBvciBJM0MgYnVzIGludGVyZmFjZS4K
PiArCSAgU3VjaCBzZW5zb3JzIGFyZSBmb3VuZCBvbiBERFI1IG1lbW9yeSBtb2R1bGVzLgo+ICsK
PiArCSAgVGhpcyBkcml2ZXIgc3VwcG9ydHMgYm90aCBJMkMgYW5kIEkzQyBpbnRlcmZhY2VzLgo+
ICAgCj4gICAJICBUaGlzIGRyaXZlciBjYW4gYWxzbyBiZSBidWlsdCBhcyBhIG1vZHVsZS4gSWYg
c28sIHRoZSBtb2R1bGUKPiAgIAkgIHdpbGwgYmUgY2FsbGVkIHNwZDUxMTguCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvaHdtb24vc3BkNTExOC5jIGIvZHJpdmVycy9od21vbi9zcGQ1MTE4LmMKPiBp
bmRleCA1ZGE0NDU3MWI2YTAuLmQ3MDEyM2UxMDYxNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2h3
bW9uL3NwZDUxMTguYwo+ICsrKyBiL2RyaXZlcnMvaHdtb24vc3BkNTExOC5jCj4gQEAgLTE4LDYg
KzE4LDcgQEAKPiAgICNpbmNsdWRlIDxsaW51eC9iaXRzLmg+Cj4gICAjaW5jbHVkZSA8bGludXgv
ZXJyLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvaTJjLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9pM2Mv
ZGV2aWNlLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvaHdtb24uaD4KPiAgICNpbmNsdWRlIDxsaW51
eC9tb2R1bGUuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9tdXRleC5oPgo+IEBAIC00ODIsNiArNDgz
LDI1IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVnbWFwX2NvbmZpZyBzcGQ1MTE4X3JlZ21hcDE2
X2NvbmZpZyA9IHsKPiAgIAkuY2FjaGVfdHlwZSA9IFJFR0NBQ0hFX01BUExFLAo+ICAgfTsKPiAg
IAo+ICsvKgo+ICsgKiBJM0MgdXNlcyAyLWJ5dGUgcmVnaXN0ZXIgYWRkcmVzc2luZyAtCj4gKyAq
ICAgQnl0ZSAxOiBNZW1SZWcgfCBCbGtBZGRyWzBdIHwgQWRkcmVzc1s1OjBdCj4gKyAqICAgQnl0
ZSAyOiAwMDAwICAgfCBCbGtBZGRyWzQ6MV0KPiArICoKPiArICogVGhlIGxvdyBieXRlIGNhcnJp
ZXMgdGhlIHJlZ2lzdGVyL05WTSBhZGRyZXNzIGFuZCB0aGUgaGlnaCBieXRlIGNhcnJpZXMgdGhl
Cj4gKyAqIHVwcGVyIGJsb2NrIGFkZHJlc3MgYml0cywgc28gbGl0dGxlLWVuZGlhbiBmb3JtYXQg
aXMgcmVxdWlyZWQuIE5vIHJhbmdlCj4gKyAqIGNvbmZpZyBpcyBuZWVkZWQgc2luY2UgSTNDIGRv
ZXMgbm90IHVzZSBNUjExIHBhZ2Ugc3dpdGNoaW5nLgo+ICsgKi8KPiArc3RhdGljIGNvbnN0IHN0
cnVjdCByZWdtYXBfY29uZmlnIHNwZDUxMThfcmVnbWFwX2kzY19jb25maWcgPSB7Cj4gKwkucmVn
X2JpdHMgPSAxNiwKPiArCS52YWxfYml0cyA9IDgsCj4gKwkubWF4X3JlZ2lzdGVyID0gMHg3ZmYs
Cj4gKwkucmVnX2Zvcm1hdF9lbmRpYW4gPSBSRUdNQVBfRU5ESUFOX0xJVFRMRSwKClNob3VsZCB0
aGlzIGJlIGFkZGVkIHRvIHNwZDUxMThfcmVnbWFwMTZfY29uZmlnIGluc3RlYWQsIG9yIGlzIHRo
ZXJlIHJlYXNvbgp0byBhc3N1bWUgdGhhdCBJMkMgMTYtYml0IGFkZHJlc3NpbmcgZGlmZmVycyBm
cm9tIEkzQyBhZGRyZXNzaW5nID8KCj4gKwkud3JpdGVhYmxlX3JlZyA9IHNwZDUxMThfd3JpdGVh
YmxlX3JlZywKPiArCS52b2xhdGlsZV9yZWcgPSBzcGQ1MTE4X3ZvbGF0aWxlX3JlZywKPiArCS5j
YWNoZV90eXBlID0gUkVHQ0FDSEVfTUFQTEUsCj4gK307Cj4gKwo+ICAgc3RhdGljIGludCBzcGQ1
MTE4X3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+ICAgewo+ICAgCXN0cnVjdCBzcGQ1MTE4
X2RhdGEgKmRhdGEgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiBAQCAtNzcwLDcgKzc5MCw1MSBA
QCBzdGF0aWMgc3RydWN0IGkyY19kcml2ZXIgc3BkNTExOF9pMmNfZHJpdmVyID0gewo+ICAgCS5h
ZGRyZXNzX2xpc3QJPSBJU19FTkFCTEVEKENPTkZJR19TRU5TT1JTX1NQRDUxMThfREVURUNUKSA/
IG5vcm1hbF9pMmMgOiBOVUxMLAo+ICAgfTsKPiAgIAo+IC1tb2R1bGVfaTJjX2RyaXZlcihzcGQ1
MTE4X2kyY19kcml2ZXIpOwo+ICsvKiBJM0MgKi8KPiArCj4gK3N0YXRpYyBpbnQgc3BkNTExOF9p
M2NfcHJvYmUoc3RydWN0IGkzY19kZXZpY2UgKmkzY2RldikKPiArewo+ICsJc3RydWN0IGRldmlj
ZSAqZGV2ID0gaTNjZGV2X3RvX2RldihpM2NkZXYpOwo+ICsJc3RydWN0IHJlZ21hcCAqcmVnbWFw
Owo+ICsJdW5zaWduZWQgaW50IHJlZ3ZhbDsKPiArCWludCBlcnI7Cj4gKwo+ICsJcmVnbWFwID0g
ZGV2bV9yZWdtYXBfaW5pdF9pM2MoaTNjZGV2LCAmc3BkNTExOF9yZWdtYXBfaTNjX2NvbmZpZyk7
Cj4gKwlpZiAoSVNfRVJSKHJlZ21hcCkpCj4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQ
VFJfRVJSKHJlZ21hcCksICJyZWdtYXAgaW5pdCBmYWlsZWRcbiIpOwo+ICsKPiArCS8qIFZlcmlm
eSB0aGlzIGlzIGEgU1BENTExOCBkZXZpY2UgKi8KPiArCWVyciA9IHJlZ21hcF9yZWFkKHJlZ21h
cCwgU1BENTExOF9SRUdfVFlQRSwgJnJlZ3ZhbCk7Cj4gKwlpZiAoZXJyKQo+ICsJCXJldHVybiBl
cnI7Cj4gKwo+ICsJaWYgKHJlZ3ZhbCAhPSAweDUxKSB7Cj4gKwkJZGV2X2VycihkZXYsICJ1bmV4
cGVjdGVkIGRldmljZSB0eXBlIDB4JTAyeCwgZXhwZWN0ZWQgMHg1MVxuIiwgcmVndmFsKTsKPiAr
CQlyZXR1cm4gLUVOT0RFVjsKPiArCX0KPiArCj4gKwllcnIgPSByZWdtYXBfcmVhZChyZWdtYXAs
IFNQRDUxMThfUkVHX1RZUEUgKyAxLCAmcmVndmFsKTsKPiArCWlmIChlcnIpCj4gKwkJcmV0dXJu
IGVycjsKPiArCj4gKwlpZiAocmVndmFsICE9IDB4MTgpIHsKPiArCQlkZXZfZXJyKGRldiwgInVu
ZXhwZWN0ZWQgZGV2aWNlIHR5cGUgMHglMDJ4LCBleHBlY3RlZCAweDE4XG4iLCByZWd2YWwpOwo+
ICsJCXJldHVybiAtRU5PREVWOwo+ICsJfQo+ICsKCkkgZG9uJ3QgdGhpbmsgdGhpcyBzaG91bGQg
ZHVtcCBlcnJvciBtZXNzYWdlcy4gQWxzbywgaXQgbWlnaHQgYmUgZGVzaXJhYmxlCnRvIHVzZSBh
IHNpbmdsZSByZWdtYXAgb3BlcmF0aW9uIHRvIHJlYWQgYm90aCB2YWx1ZXMuCgo+ICsJcmV0dXJu
IHNwZDUxMThfY29tbW9uX3Byb2JlKGRldiwgcmVnbWFwLCBmYWxzZSk7CgpXaHkgaXNfMTZiaXQ9
ZmFsc2UgPwoKVGhhbmtzLApHdWVudGVyCgo+ICt9Cj4gKwo+ICtzdGF0aWMgc3RydWN0IGkzY19k
cml2ZXIgc3BkNTExOF9pM2NfZHJpdmVyID0gewo+ICsJLmRyaXZlciA9IHsKPiArCQkubmFtZQk9
ICJzcGQ1MTE4X2kzYyIsCj4gKwkJLm9mX21hdGNoX3RhYmxlID0gc3BkNTExOF9vZl9pZHMsCj4g
KwkJLnBtID0gcG1fc2xlZXBfcHRyKCZzcGQ1MTE4X3BtX29wcyksCj4gKwl9LAo+ICsJLnByb2Jl
CQk9IHNwZDUxMThfaTNjX3Byb2JlLAo+ICt9Owo+ICsKPiArbW9kdWxlX2kzY19pMmNfZHJpdmVy
KHNwZDUxMThfaTNjX2RyaXZlciwgJnNwZDUxMThfaTJjX2RyaXZlcik7Cj4gICAKPiAgIE1PRFVM
RV9BVVRIT1IoIlJlbsOpIFJlYmUgPHJlbmVAZXhhY3Rjb2RlLmRlPiIpOwo+ICAgTU9EVUxFX0FV
VEhPUigiR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PiIpOwoKCi0tIApsaW51eC1p
M2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
