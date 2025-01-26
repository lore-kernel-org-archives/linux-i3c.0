Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2037CC02199
	for <linux-i3c@archiver.kernel.org>; Wed, 29 Jan 2025 20:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NvrPtEnHmzLl8WZixs+64n7GDImVgsVPHwvqg8qG/xM=; b=gRWzPvMj5WzP+o
	jv9fsyrkD66n9TNQ11/WyHvFIwwF2mU2cIwl6itHlQNOuPydsdLUVn/9hTIBl4IJYDafgVVeNGRKp
	THYlbvoThgw+x4rUrDSm2Tg3KD0H1pvx12zh2O5KEVKbREyyEgikFX4WVTrZGjja5QYEL3kEnCSIj
	JqtGJYNw9UcRO+gEiCojO55XhCTVDfEIkKVFKva3XlN04vMsVRqtufVRiNPtoul6/zZDca9zz5GPS
	r4I5k6pckybYp9DrtCfe4mRqABVZW8bEP/0kQ8DnjErAYP5l+4EPtoJ60O8dPxrqEJ1tel79PL1+i
	+rgHh7KGKAWfQzbcQGnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdElt-00000007lOQ-3UhY;
	Wed, 29 Jan 2025 20:34:49 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc6iC-00000000Vax-14rx
	for linux-i3c@lists.infradead.org;
	Sun, 26 Jan 2025 17:46:21 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e398484b60bso5504497276.1
        for <linux-i3c@lists.infradead.org>; Sun, 26 Jan 2025 09:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737913578; x=1738518378; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XwP6AmZtHOBgTFWNHWplhL+BYlJ0uLnqNJ1QKPcccSI=;
        b=iGO0oqiB25jtzBlgMAxzi9KGCCrXcjj4IxzKH3bRqsZY2BCAVxtqB1+HYDlBZoYWzN
         BV+ZN43Y1XI9jGrhLvUIsGd1ruFvH9+3ysxGPQR59RjK3J7sbBdamKe26MW29YWxAjRK
         6UGU/BCSLcXvnp0Bt7UnjwqfpESAMgMgGNEvdRaljHTunOUX+ErtHsYSRsKc6LEszx4P
         VlJFdzYJ+u8j6G84LCd4ymaKuNx9TX43NVBphwp1q2qKOvpxd5XZFZI6bseRY1Y4iHKq
         6IF2mkh3i1nEvaaQv/Dc/q0UUkX6t5G7Fh5Fd7sGDIxOcZq/hBIPENY0oqPXoqMyIRUW
         s/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737913578; x=1738518378;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XwP6AmZtHOBgTFWNHWplhL+BYlJ0uLnqNJ1QKPcccSI=;
        b=FmWPaBbbJgxPLo2Jzrfu+HA2FClB8ZOydT5gSf2ifECJuj1g8iDVsYJLj6wXbw1Xs4
         S3ECFS6sYJ+qcDMFWRyUp9CCDv0uXFkU4010oFu1N6hbMr6X3XJQQ2oe3HAeUQzAl6k4
         g1XvT2bS5dYsduwGqZEZe5QLTl3YHrEnrGcTQ2TfqVpvRl5Do9nY++GP3uzVQck7L5CN
         HheTsq91J4aCfiwigDm+wnoZ7YCjuo+ygcIh8rTAK1dDdjS7asi9FDP3FB6bTbGoq2Gd
         BB3jbxZar6UnipRb//AbFil/HETMuo5r6WLVBWvMpf5gx4bpXjk6YOa6bz04R3EE/aM0
         DXAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWkZeDv0ehb2HZbcYoraybZ3T1Y8KxQRVWTOWecPRkUEUYHx2P89TJm7iRJQ3/9BTun5d7djW9WRU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxMoV9VNSFf0DgpoghbA82oRyDHRGr2451U4+6qBLbtW5tl2iZV
	CeqPp7T1uMwbF5cHDNrXIUA6wi0GPDtftiOJTit+y8BsIKjUp8V+
X-Gm-Gg: ASbGncseLHhqHXCxsl38uoTXx+ccCAaI/NHxfxZMmYozsznVqtvlvH0BzVN9BVd8V6/
	U2bRAdyvw7d5x26jGYs0FxzNSB9RNthMf61rFdws75CtrxUloTpLkz8TZR/a+IoQqvYowDqhsZq
	bD6e8ZBT8Bfgo4jBVzCUCjLJefPph3dVCKClMyW/8PJEjH8YTcxrcTMfs5ddKWdWpMBbIKNJNzd
	lhnpun+md2Ak3e7AQJFCPdKNBC0qu5uWodLMVCS0hSoYdkJYBKYuhqFWzm+AZpTuehPfqRVYkdy
	XMqk4J8OgHZgYZ7DC47LvhpK522/07yDQEUTHKMAUARAJABNotg=
X-Google-Smtp-Source: AGHT+IGO1xwVW2l1LTQ+o+lYbUxQvekVO4YA1p5kU65hCGKORVU3e+VmeRoBj3dBeymOr5vl4GWC3Q==
X-Received: by 2002:a05:690c:2008:b0:6f7:534b:560a with SMTP id 00721157ae682-6f7534b56aamr70501867b3.8.1737913578433;
        Sun, 26 Jan 2025 09:46:18 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f757a372fbsm11330997b3.117.2025.01.26.09.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 09:46:17 -0800 (PST)
Date: Sun, 26 Jan 2025 12:46:17 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Kuan-Wei Chiu <visitorckw@gmail.com>, linus@ucla.edu
Subject: Re: [PATCH] bitops: use safer link explaining the algorithm
Message-ID: <Z5Z06WowFspmXby9@thinkpad>
References: <20250125130320.38232-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWmE2UiE7kwAyQKONSE_ytrNux+Wwu-v__K=jjpAutxqw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdWmE2UiE7kwAyQKONSE_ytrNux+Wwu-v__K=jjpAutxqw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_094620_321760_469D5AA4 
X-CRM114-Status: GOOD (  26.03  )
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

T24gU2F0LCBKYW4gMjUsIDIwMjUgYXQgMDQ6MTA6MzZQTSArMDEwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IEhpIFdvbGZyYW0sCj4gCj4gQ0MgTGludXMgKHRoZSBmdW5sb29wIG9uZSA7
LSkKPiAKPiBPbiBTYXQsIEphbiAyNSwgMjAyNSBhdCAyOjAz4oCvUE0gV29sZnJhbSBTYW5nCj4g
PHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tPiB3cm90ZToKPiA+IER1cmluZyByZXZp
ZXcsIGEgY29uY2VybiB3YXMgcmFpc2VkIHRoYXQgdGhlIGxpbmsgZXhwbGFpbmluZyB0aGUKPiA+
IGFsZ29yaXRobSBtaWdodCBnZXQgc3RhbGUuIE1lYW53aGlsZSwgdGhlIHNpdGUgaGFzIGJlZW4g
YXJjaGl2ZWQgaW4gdGhlCj4gPiBXYXlCYWNrIG1hY2hpbmUuIFNvLCB1c2UgdGhlaXIgbGluayB3
aGljaCBpcyBob3BlZnVsbHkgbW9yZSBzdGFibGUuCj4gPgo+ID4gRml4ZXM6IGMzMjA1OTJmM2Yy
YSAoImJpdG9wczogYWRkIGdlbmVyaWMgcGFyaXR5IGNhbGN1bGF0aW9uIGZvciB1OCIpCj4gPiBT
aWduZWQtb2ZmLWJ5OiBXb2xmcmFtIFNhbmcgPHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcu
Y29tPgo+IAo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEKPiAKPiA+IC0tLSBhL2luY2x1ZGUvbGlu
dXgvYml0b3BzLmgKPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvYml0b3BzLmgKPiA+IEBAIC0yNTQs
NyArMjU0LDcgQEAgc3RhdGljIGlubGluZSBpbnQgcGFyaXR5OCh1OCB2YWwpCj4gPiAgewo+ID4g
ICAgICAgICAvKgo+ID4gICAgICAgICAgKiBPbmUgZXhwbGFuYXRpb24gb2YgdGhpcyBhbGdvcml0
aG06Cj4gPiAtICAgICAgICAqIGh0dHBzOi8vZnVubG9vcC5vcmcvY29kZXgvcHJvYmxlbS9wYXJp
dHkvUkVBRE1FLmh0bWwKPiA+ICsgICAgICAgICogaHR0cDovL3dlYi5hcmNoaXZlLm9yZy93ZWIv
MjAyNTAxMDUwOTMzMTYvaHR0cHM6Ly9mdW5sb29wLm9yZy9jb2RleC9wcm9ibGVtL3Bhcml0eS9S
RUFETUUuaHRtbAo+IAo+IElzIHRoZSBwbGFuIHRvIHJlcGxhY2UgYWxsIHdlYmxpbmtzIGJ5IHdl
YmFyY2hpdmUgbGlua3MgYXMgYSBwcmVjYXV0aW9uPwo+IEV2ZW4gd2Vic2l0ZXMgYmFja2VkIGJ5
IGJpZyBjb21wYW5pZXMgbWF5IGRpc2FwcGVhclsxXS4uLgo+IFB1dHRpbmcgdGhlIHdlYmFyY2hp
dmUgbGluayBoZXJlIGFsc28gaW1wYWN0cyB0aGUgZnVubG9vcC5vcmcgc2VydmVyCj4gc3RhdGlz
dGljcywgZG93bnBsYXlpbmcgaXRzIHJlbGV2YW5jZSwgYW5kIHBvc3NpYmx5IGV2ZW4gY2F1c2lu
ZyBhbgo+IGVhcmxpZXIgc2h1dGRvd24uCj4gVGhlIFVSTCBjYW4gYWx3YXlzIGJlIHVwZGF0ZWQg
d2hlbiB0aGUgb3JpZ2luYWwgc2l0ZSBkaXNhcHBlYXJzLgo+IAo+ID4gICAgICAgICAgKi8KPiA+
ICAgICAgICAgdmFsIF49IHZhbCA+PiA0Owo+ID4gICAgICAgICByZXR1cm4gKDB4Njk5NiA+PiAo
dmFsICYgMHhmKSkgJiAxOwo+IAo+IFsxXSBUaGUgIkxlc3NXYXR0cy5vcmciIFQtc2hpcnQgSSBn
b3QgZnJvbSBJbnRlbCBzdXJ2aXZlZCB0aGUKPiAgICAgY29ycmVzcG9uZGluZyB3ZWJzaXRlIGJ5
IG1hbnkgeWVhcnMgOy0pCgpUaGF0IHdhcyBhY3R1YWxseSBteSBjb25jZXJuLiBJIHVzZWQgdG8g
dGhpbmsgdGhhdCBrZXJuZWwgcmVwb3NpdG9yeQpzaG91bGQgYmV0dGVyIGJlIGEgc2VsZi1jb250
YWluZWQgdGhpbmcuIEFuZCB0aGUgcmVhc29uIGlzIHRoYXQga2VybmVsCnNvdXJjZXMgc2hvdWxk
IGJlIHVuZGVyc3RhbmRhYmxlIGV2ZW4gb24gYW4gQXRsYW50aWMgZmxpZ2h0LgoKQnV0IHRoaXMg
ZGF5cyBhaXJsaW5lcnMgaGF2ZSBwcmV0dHkgZ29vZCBpbnRlcm5ldCBhY2Nlc3MuIFNvIEkgZG9u
J3QKd2FudCB0byBsb29rIGxpa2UgYSBndXkgcHVzaGluZyA4MC1jaGFycyBsaW5lIGxpbWl0LCB3
aGlsZSB3ZSBmb3Jnb3QKZXZlbiB0aGUgbWVhbmluZyBvZiBWR0EgYWNyb255bSBtYXliZSAxNSB5
ZWFycyBhZ28uCgpRdWljayBncmVwcGluZyBzYXlzIHRoYXQgdGhlIGluY2x1ZGUvbGludXggZGly
ZWN0b3J5IGFscmVhZHkgaGFzIDIzNQonaHR0cCcgbGlua3MuIEV2ZW4gYWZ0ZXIgZXhjbHVkaW5n
IGNvbXBpbGVyIGxpbmthZ2UsIHdlIGhhdmUgMTQ5IG9mIHRoZW0uCgpTby4uLgoKSWYgeW91IGd1
eXMgZmVlbCB0aGF0IHlvdSBjYW4gZXhwbGFpbiB0aGUgYWxnb3JpdGhtIHlvdSdyZSBlbXBsb3lp
bmcKaW4gYSBoYWxmLVZHQS1zY3JlZW4gY29tbWVudCwgaXQgd291bGQgYmUgdGhlIGJlc3QgY2hv
aWNlLCBhbmQgdGhhdCdzCmVub3VnaC4KCklmIGl0J3MgaW1wb3NzaWJsZSBvciB5b3UgdGhpbmsg
dGhhdCBleHRlcm5hbCByZWZlcmVuY2UgaXMgcmVhbGx5IG5lZWRlZCwKSSB0cnVzdCB5b3UuIEJ1
dCBwbGVhc2UgcmVmZXIgdGhlIG9yaWdpbmFsIHNvdXJjZS4gSW4gdGhpcyBjYXNlLCBpdCdzOgoK
ICAgICAgICBXYXJyZW4sIEguIFMuICgyMDEzKS4gSGFja2Vy4oCZcyBEZWxpZ2h0ICgybmQgZWQp
LCBwYWdlIDk3LgoKSWYgeW91IHRoaW5rIHRoYXQgcG9pbnRpbmcgdG8gYSB3ZWItcGFnZSB3aXRo
IG5pY2Ugc3VtbWFyeSB0byB0aGUgdG9waWMgCmlzIGhlbHBmdWwgLSBwbGVhc2UgZG8uIEFuZCBp
ZiB5b3Ugd291bGQgbGlrZSB0byBjYWNoZSB0aGUgbGluayAtIEkndmUKZ290IG5vdGhpbmcgYWdh
aW5zdCBpdCAtIGFzIHNvb24gYXMgeW91IGNvbW1pdCB0byBtYWludGFpbiB0aG9zZSBsaW5rcwp1
cC10by1kYXRlIGluIHRoZSBrZXJuZWwgc291cmNlcy4KClRoYW5rcywKWXVyeQoKLS0gCmxpbnV4
LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
