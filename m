Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC578C369AB
	for <linux-i3c@archiver.kernel.org>; Fri, 18 Apr 2025 08:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XPRFN6NxG5e+T+EV1pQ4PD5Q3pxlpBjNkKXnFNL2yuc=; b=RoriLiCDZeGRQ8
	gtK1UqxwAKEuIyX/fsTQB2GHJJrYTCSTGbTQYZg4SckPLT0uWfDoA4TKa5vpokCU97HxHX4QifJE8
	ytbhUNJCvKlF+nJrfLlq8yRjWk0WmeTActw8NWB4IdxEN1G2GysqyRHk389H8KSqLObN7AgxvQzTz
	wveVEmNUe2GCuXohUPNq8YBvVwhfrA+7dcNknL3jEL4GgtEnqhl1+c3KCG9bCWOH33zrip8CksuKz
	T5TOW3RFWz1D+te3cXXUkonqzAoRpRH2+Vxl2SBi8CGVAK5pacYffjqc1bw4yMRPKpqIPXnK1DVSu
	LL7DpB+MaEwUiBYiuS/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gf0-0000000FYX4-2kIQ;
	Fri, 18 Apr 2025 08:01:18 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gKU-0000000FV03-2mIv
	for linux-i3c@lists.infradead.org;
	Fri, 18 Apr 2025 07:40:07 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3d450154245so12863325ab.2
        for <linux-i3c@lists.infradead.org>; Fri, 18 Apr 2025 00:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744962005; x=1745566805; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkmJ2/zUYp0Fc3KQImo7xdJUrkMqZsLuifpe7h36Wac=;
        b=lm7+mahoHFPnx4lUQTWdjYLsWfZP6cJWbvnDIhcZXBs2yWdeI9Ax5Pp4I7BMPh9AkY
         E7j6SgFWlO1D6GkGdjqH72+kWGGSOL9AEG4ctFWRstEEngyyvT+xwdM3tj0O8GfhgU5l
         M1k0OHVb5JW0hoDZ1/F5G+QASc5/6OnnF8UAub64Xs+RyUzDAVGegByOrwpJr1OpV7Hj
         JAVPPY8S0MPMCn+h9FmuLWzo1EXYvFf5B0UQT2C5FtlnyzqDogk9Eu8P9c+xO0mu9UoQ
         5LtixEMXXxWxVkTrEBuSL2IcRp0Q7qBZtuawmCeD5tFn9anR59Ppnr4f2Eb9eO86WbbB
         G+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744962005; x=1745566805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkmJ2/zUYp0Fc3KQImo7xdJUrkMqZsLuifpe7h36Wac=;
        b=wbNURawKjsc/9vVFdAme0EPtTmN2UcrOe3M89bqfd2GdGUt7p5Zz3/wKGt7A8bon3Q
         uDKLAuW232V5b6pbL2Wq3p8+xSLsNbtLV6N94mo/aLxhMmujVGU5yf6ToMzA/NFNbxgX
         cpsgX0BJcxzbcuCcMOkmwkGi/J8rXV4/IpJt7Og1A5j7QjVChumVr6ZNT9bDW4wTZmYH
         Ba49xzZtqNch/gvBa+9cjGMSuLsKrBZ+VicmGoLrT4QGy8s49+QHB2F9iiG/AFcz9rZg
         a3ngwvqWjwReZoM1TLvOkkR0F/x8M9JqgVSNx0OCgcCxVolIW6ZFXMDdbvCK0G0Ux99E
         M1HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhJRJEijZGs2MW9LXA5WX53QRq/Hy1SAWOGKDDJsx1KpUXNSmLFL4+/qsj6rLNqqKM7IwlP1s4TpA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyZqW7SoAoTLg2vPN57b9jSqL2CaoKG3DzZq0xpeYs1FA7Rvoka
	dNHvanb5nn8eyOP5MoQk2c0/OwvsDSJKBfEjpnLuirXyTWUWdqhgGP32vHBWCHGDTX7r/76ppjI
	e+rpI5f5v1R3QjKokCUBNsLNpqGw=
X-Gm-Gg: ASbGncsXnwukhRn/Vy+6QBln7JuhHmI6VjO49PF5auGHGdQ6B/TzgvOzYVRAK/5y5S8
	ONHrYyYLxqmG6TPHJHo3sa9sabpoqe86J2WQhDi8Xh13yKKyUMljzovjKWMYmwb1Z3rAu7ya5a/
	C2BhmgQDlXTEub1/jpKrrN
X-Google-Smtp-Source: AGHT+IErxKRVjGKLa98ewYSC6k/+9FJnAZxh+oixS1Arok3ASPW8saLU/nIW+BIPDJzHAih5cRtNP0OSREI5EHz24g4=
X-Received: by 2002:a05:6e02:12e7:b0:3d8:1885:837d with SMTP id
 e9e14a558f8ab-3d88fccc4e6mr16634145ab.22.1744962005298; Fri, 18 Apr 2025
 00:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250415051808.88091-1-yschu@nuvoton.com> <87ikn5ygfd.fsf@bootlin.com>
In-Reply-To: <87ikn5ygfd.fsf@bootlin.com>
From: Stanley Chu <stanley.chuys@gmail.com>
Date: Fri, 18 Apr 2025 15:39:54 +0800
X-Gm-Features: ATxdqUEgID4JwE8npaubEOgK_7WVdVRuS4qC3ntc2D_hDo24wStrJHPuryG7fK4
Message-ID: <CAPwEoQOuvwzf+VcXJpx0LB0v_ZdCoB=rJW_ekHYo6ATY57LYDA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] svc-i3c-master: Reduce IBI transaction time
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: frank.li@nxp.com, alexandre.belloni@bootlin.com, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_004006_700448_0E94A67A 
X-CRM114-Status: GOOD (  10.18  )
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

T24gVHVlLCBBcHIgMTUsIDIwMjUgYXQgNDozMeKAr1BNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gMTUvMDQvMjAyNSBhdCAxMzoxODowNiAr
MDgsIFN0YW5sZXkgQ2h1IDxzdGFubGV5LmNodXlzQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+IFRo
aXMgcGF0Y2hzZXQgcmVkdWNlcyB0aGUgSUJJIHRyYW5zYWN0aW9uIHRpbWUgYnkgdGhlIGZvbGxv
d2luZwo+ID4gaW1wcm92ZW1lbnRzLgo+ID4gMS4gUmVjZWl2ZSB0aGUgcmVxdWVzdCBpbiBpbnRl
cnJ1cHQgY29udGV4dC4KPgo+IEkgaW5pdGlhbGx5IGhhZCBhIGZldyBjb25jZXJucyBhYm91dCB0
aGF0LCBlc3BlY2lhbGx5IHNpbmNlIHRoZSB3YWl0Cj4gcGVyaW9kcyB3ZXJlIGJvdW5kZWQgdG8g
MXMsIGJ1dCBhY3R1YWxseSB3ZSBhcmUgYWxyZWFkeSBpbiB0aGUgaXJxc2F2ZQoKSGkgTWlxdWVs
LApUaGUgcG9sbCB0aW1lb3V0IGlzIDEgbXMuIE5vcm1hbGx5LCB0aGUgSUJJIGNhbiBiZSBjb21w
bGV0ZWQgaW4gYSBmZXcgdXMuCgpUaGFua3MsClN0YW5sZXkKCj4gc2l0dWF0aW9uIHdoZW4gcnVu
bmluZyB0aGlzIGNvZGUsIHNvIHlvdXIgc2VyaWVzIG1pZ2h0IG5vdCBoYXZlCj4gc3VjaCBhIGh1
Z2Ugc3lzdGVtLXdpZGUgcGVyZm9ybWFuY2UgaW1wYWN0IGluIHRoZSBlbmQuCj4KPiA+IDIuIEVt
aXQgdGhlIFNUT1AgYXMgc29vbiBhcyBwb3NzaWJsZS4KPgo+IEFja2VkLWJ5OiBNaXF1ZWwgUmF5
bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKCi0t
IApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
