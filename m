Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A9BC0218C
	for <linux-i3c@archiver.kernel.org>; Sat, 25 Jan 2025 15:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FJz02pf3X06woKvWi6EZeiX4mjVGmZmPzBVn1pBq9Vo=; b=pIxyiDYTl3AN41
	AjniSpqVp8ZZsIHQpDu/qeRaBR+4lrth6/bhbNqMQOROtsb9jFezlecHqwWcnIaaFgQ89YnrWs9Ay
	3rXqSDdnyQBWjX/H5xEAf4UsoJlrJkrOpo5H9smOuPzzo7b5FCTuLO95DvZ3VGCwiKlH2f5F+InRo
	W71Ri0b+zUsFgY2x/kg6ciXAeZxoT6Dh3XQqceoSb5Un75PRmaiMzLr7+Ns6mKfCK19JG2u6Iw2VO
	EvmTYoDqBcb1HmjwJFDlyEPD13jAvFFlQTpJEjNQvtGUuhm+qBmKYmIYG6KZM042XFgHm/AU2ZIfx
	lohqYQ1Iy9d90qStj6Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbhoG-0000000GWJv-3Sf9;
	Sat, 25 Jan 2025 15:10:56 +0000
Received: from mail-qv1-f51.google.com ([209.85.219.51])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbhoD-0000000GWJJ-35vL
	for linux-i3c@lists.infradead.org;
	Sat, 25 Jan 2025 15:10:55 +0000
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6dd1b895541so62356486d6.0
        for <linux-i3c@lists.infradead.org>; Sat, 25 Jan 2025 07:10:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737817849; x=1738422649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yl0y3ZRFBNaiiUtaKMgetw1t+oUGHgdioy/xMc9ew8w=;
        b=VPCuFnkcSdENoN7xFTk8PuHLzW3RQnTZI8tW3zLzpeS3Tg29xYIFX8f7rIHyzed+K0
         AWZ2HrMyYIH1+L1kcezRLHVWKN6exrDxLed7ec0hY+NtSaAUret2rXCd2I3CSDo3b+lW
         /JapK4nh1liFXgdaXA34l+3tZI7fBY+YtTEscy55hHwaZycwMWxq4aoPzZg1CpjvqP+4
         Nuco0laKTvoklO6Hu6/zcvkW9rzAUqGkhz7ZaQgDLl/VMj2Iew8BRR7TxPVQ/c0lsOr1
         hTCy9uALSFMQx+nU62/JD50lstWVqMYcOooFyMTJMsqfmjyYSP6lBgSEmVNe5vGwKCrF
         ThSA==
X-Forwarded-Encrypted: i=1; AJvYcCXVBECDt31cNM1PNndyLkkVXGa/OI1goTd2QUjm4ipwcoBrWRg8YyFVHQk0vEHaDNqDUyy4xOJs4HE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc8+LLtx5TDRJhIItMQRTpYVQXkq6yrISWm5ndNOaMJmkCZHCe
	H1Rz0KkiTBqEGaZJ4MbRDH1v2NGHCreBJ/NBWn2qryvlysBjYb5cHFX7TSCu
X-Gm-Gg: ASbGncsbijHAmDzPRV3demhv/Kft8EQVxxK0uMXsT9WqGI+TNR7jCQUfl/T5D1kqtGK
	wG0yzwydRu+rPWymZ63WxI5MRtmQHQIlOPBVIOZUjZ3QM1BY6+vKjghiTqLlJPEKfGMjVJziSkF
	taSLUhzXezvejDN6TcwzgqgDgC1OseADbUSHNUTCe2MBMZNVXNK3d7Lnk9bur8lR0MO5zmJGI9c
	61sIR+fCmzoiikKmJ6r3mGs9Mb104PDaNibJY986SnUaK4CodRGe0qTEui9TJvXVBdyPsCSTm3G
	Hvdva6rISmiWL38KTPvCSJk6BDOtmR7+AtUKbdPaNtbfndc=
X-Google-Smtp-Source: AGHT+IH4hHZgi0kZiqXUoad+lGCYneeu/0dvSO15azsZQfXGg6sPFNQAXmamYnbsnZcuicMAdQRHVQ==
X-Received: by 2002:ad4:5742:0:b0:6d8:821d:736e with SMTP id 6a1803df08f44-6e1b220d9b1mr657144746d6.36.1737817848803;
        Sat, 25 Jan 2025 07:10:48 -0800 (PST)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2051369c5sm18660946d6.5.2025.01.25.07.10.48
        for <linux-i3c@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jan 2025 07:10:48 -0800 (PST)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-46c7855df10so51318691cf.3
        for <linux-i3c@lists.infradead.org>; Sat, 25 Jan 2025 07:10:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXi8OG7M/0Ds1OaMuMQ0nUKQeWLqHHRUEFua8ggFS/HqUq93//dfxASjxX5XYMiF3Rg4nZzHD6oXag=@lists.infradead.org
X-Received: by 2002:ac8:7f4b:0:b0:467:7fbf:d115 with SMTP id
 d75a77b69052e-46e12a621a8mr489273651cf.12.1737817847878; Sat, 25 Jan 2025
 07:10:47 -0800 (PST)
MIME-Version: 1.0
References: <20250125130320.38232-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250125130320.38232-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 25 Jan 2025 16:10:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWmE2UiE7kwAyQKONSE_ytrNux+Wwu-v__K=jjpAutxqw@mail.gmail.com>
X-Gm-Features: AWEUYZn0QS7RZLs9ffY0rgAQ__EcUHBIhtag5ev1XTEwN-1xPhngzf26haF0vhA
Message-ID: <CAMuHMdWmE2UiE7kwAyQKONSE_ytrNux+Wwu-v__K=jjpAutxqw@mail.gmail.com>
Subject: Re: [PATCH] bitops: use safer link explaining the algorithm
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kuan-Wei Chiu <visitorckw@gmail.com>, linus@ucla.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_071053_776860_2BB9592B 
X-CRM114-Status: GOOD (  19.97  )
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

SGkgV29sZnJhbSwKCkNDIExpbnVzICh0aGUgZnVubG9vcCBvbmUgOy0pCgpPbiBTYXQsIEphbiAy
NSwgMjAyNSBhdCAyOjAz4oCvUE0gV29sZnJhbSBTYW5nCjx3c2ErcmVuZXNhc0BzYW5nLWVuZ2lu
ZWVyaW5nLmNvbT4gd3JvdGU6Cj4gRHVyaW5nIHJldmlldywgYSBjb25jZXJuIHdhcyByYWlzZWQg
dGhhdCB0aGUgbGluayBleHBsYWluaW5nIHRoZQo+IGFsZ29yaXRobSBtaWdodCBnZXQgc3RhbGUu
IE1lYW53aGlsZSwgdGhlIHNpdGUgaGFzIGJlZW4gYXJjaGl2ZWQgaW4gdGhlCj4gV2F5QmFjayBt
YWNoaW5lLiBTbywgdXNlIHRoZWlyIGxpbmsgd2hpY2ggaXMgaG9wZWZ1bGx5IG1vcmUgc3RhYmxl
Lgo+Cj4gRml4ZXM6IGMzMjA1OTJmM2YyYSAoImJpdG9wczogYWRkIGdlbmVyaWMgcGFyaXR5IGNh
bGN1bGF0aW9uIGZvciB1OCIpCj4gU2lnbmVkLW9mZi1ieTogV29sZnJhbSBTYW5nIDx3c2ErcmVu
ZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbT4KClRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCj4gLS0t
IGEvaW5jbHVkZS9saW51eC9iaXRvcHMuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvYml0b3BzLmgK
PiBAQCAtMjU0LDcgKzI1NCw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IHBhcml0eTgodTggdmFsKQo+
ICB7Cj4gICAgICAgICAvKgo+ICAgICAgICAgICogT25lIGV4cGxhbmF0aW9uIG9mIHRoaXMgYWxn
b3JpdGhtOgo+IC0gICAgICAgICogaHR0cHM6Ly9mdW5sb29wLm9yZy9jb2RleC9wcm9ibGVtL3Bh
cml0eS9SRUFETUUuaHRtbAo+ICsgICAgICAgICogaHR0cDovL3dlYi5hcmNoaXZlLm9yZy93ZWIv
MjAyNTAxMDUwOTMzMTYvaHR0cHM6Ly9mdW5sb29wLm9yZy9jb2RleC9wcm9ibGVtL3Bhcml0eS9S
RUFETUUuaHRtbAoKSXMgdGhlIHBsYW4gdG8gcmVwbGFjZSBhbGwgd2VibGlua3MgYnkgd2ViYXJj
aGl2ZSBsaW5rcyBhcyBhIHByZWNhdXRpb24/CkV2ZW4gd2Vic2l0ZXMgYmFja2VkIGJ5IGJpZyBj
b21wYW5pZXMgbWF5IGRpc2FwcGVhclsxXS4uLgpQdXR0aW5nIHRoZSB3ZWJhcmNoaXZlIGxpbmsg
aGVyZSBhbHNvIGltcGFjdHMgdGhlIGZ1bmxvb3Aub3JnIHNlcnZlcgpzdGF0aXN0aWNzLCBkb3du
cGxheWluZyBpdHMgcmVsZXZhbmNlLCBhbmQgcG9zc2libHkgZXZlbiBjYXVzaW5nIGFuCmVhcmxp
ZXIgc2h1dGRvd24uClRoZSBVUkwgY2FuIGFsd2F5cyBiZSB1cGRhdGVkIHdoZW4gdGhlIG9yaWdp
bmFsIHNpdGUgZGlzYXBwZWFycy4KCj4gICAgICAgICAgKi8KPiAgICAgICAgIHZhbCBePSB2YWwg
Pj4gNDsKPiAgICAgICAgIHJldHVybiAoMHg2OTk2ID4+ICh2YWwgJiAweGYpKSAmIDE7CgpbMV0g
VGhlICJMZXNzV2F0dHMub3JnIiBULXNoaXJ0IEkgZ290IGZyb20gSW50ZWwgc3Vydml2ZWQgdGhl
CiAgICBjb3JyZXNwb25kaW5nIHdlYnNpdGUgYnkgbWFueSB5ZWFycyA7LSkKCkdye29ldGplLGVl
dGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJo
b2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4
LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3Bs
ZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5h
bGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKLS0gCmxpbnV4
LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
