Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198FCC87FCD
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Jul 2025 11:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GIZWJG08iYL8GY7AsoRn1jM38GU5iKkOeWyGJV6Msuc=; b=kqV3sG0hpWZEOI
	qXrUjJ/JGeId2ev8eeaCJXu5+HU8QPo98szuIeInpjXzIWundfhJsjQDz2uqwoftz6J4JevJtnfxi
	aRVUYhsGG4h1KuK7AjL4eBknFR53ZdqGP9M6LcbhSvnxvCLHlMH1VZpFCTVdk8Tnsn9pgTimY0Zrb
	EMzFnX7SSLnA+cGP16Xgq7rfuTJenM7gi55Rb5FxEl2Z/ii3GHWpYAkGeWpFFrCGgPSv+ySLPev4H
	Ssp8fldu3WNHx306E2prFCZDP87qqe5GuRHZW/jFQ9GOKVIsCmpPvhwfEF2/vFXsdcG5SXdCxY1I0
	e8WtY0aoPR2g8TFzmewA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAxA-00000002Fpe-3L62;
	Tue, 22 Jul 2025 11:14:36 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue4AI-00000001Dp5-2fcT
	for linux-i3c@lists.infradead.org;
	Tue, 22 Jul 2025 03:59:45 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b3bcb168fd5so4208766a12.3
        for <linux-i3c@lists.infradead.org>; Mon, 21 Jul 2025 20:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753156781; x=1753761581; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXXOavQ4WOy2gE8aAWn+LnkavWdDlut0iVqvj5kQmL0=;
        b=MCTlFI7qbJDcSD4znUriiVo8V21OL2f2dB51MCztuG/W7daT4Z6Sf+fBusZgTruY94
         ifu+SYVUjWxSnNnOKsebIm+dsI0D69bJsGgc17dcorJQ0VpUg7vhv9P8thjDoxWFLGqP
         XudU+oXI3e1+xtd3i0a+GopL2qA2xaJQhEtMOaoW82tWEm2hND4BYSyT/q/38WHZs2tP
         vOnFdP8qKXbGdSz2Qeee324+/M9cWl7ddS/xx9ybhvSwuvRzvFKgdNsjDZHZ6r0Xz022
         hheh6QVAUWDo5ArWBkJThDiRqD7Fqi8+DGCOdfsd3YvKGW18EL06z142QXJlMiwfp2A4
         fc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753156781; x=1753761581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXXOavQ4WOy2gE8aAWn+LnkavWdDlut0iVqvj5kQmL0=;
        b=pBjk0N7+prvK0TpswHH8hT9XRy5FEQZq+LuhIlZ8JjKY7QhZN8Se/J2u8l3cdJ8DVP
         x/xMITgsdhPlvekH/qLap7aK8tX++SQiHUEIwhO+2HXOH1jo8CNKBQVdsaep001IetVv
         r3Fsj5B/dPhvpp8WmBc3e8fIsVkKRsJPvsf9wviKDTTyAKj29Fb6R1m4jAeVVF34PJ3w
         YKaH5mI/o1HUp8dcq6eez9cfFkypASlRqsQgYCOQx4n0j+5pHwQP/D+ulv0X010tRbdL
         tfyRfi0Qcmq/dIw3SUR41qyPhukBgINgrZDg/jK4aWthz2VkwhrmR7qT9kILh1g8Ji3k
         j8xA==
X-Forwarded-Encrypted: i=1; AJvYcCW0s+BUQFW1YvhfHUL18IXXXgL7Z7AbJNSU4ezpxvpVBt5Ylpo9xZk8rFwgpTR+0xvzlItmhOVCPbM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyxpFN8Pdhws8VWMk0+p0+saQ/WhBheXe5bMXGRyuWC86MW3xYj
	j5m7ReFppDgOag/toj0Q81zaPR/aTCHw26GZWBXoyw2PTj1lun0QsEN+R+4eqFm7LOTWX+xiwSZ
	ixrii2OoXmqL01LSOdAsGDXE1XlU4D4M=
X-Gm-Gg: ASbGncvHBG0VgaKr8pS3kps+MdPVuo9VSh1GnXE8JuTPh3pQgU7NAeQ11aTy1vM65ET
	heN7xAwxohe+sHJ8YikHSTapyesKnraHt9qcjl4zbJSAODK0y2GwUw5i/jH3xyHpv/yu4QCO7gA
	kXglemTEzzx6T1wFz5UTG3m2DbHNJ7KjKDJS8HcV8h4zW1PkgI2IbrSm2+N1qezsu0KAVYrczoU
	cjyBiA/5w==
X-Google-Smtp-Source: AGHT+IE89eLL47Hf4D1CEwGtR86mrukxEHw9vX/u6lpqJWi3y3SDJHMW63vPpjaWuKbwDGISOChwVGhNpGUIMHBPG8c=
X-Received: by 2002:a17:903:3bc5:b0:235:6e7:8df2 with SMTP id
 d9443c01a7336-23e2575a8d6mr314731345ad.41.1753156781485; Mon, 21 Jul 2025
 20:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250720152401.70720-1-luis.hernandez093@gmail.com>
 <20250720152401.70720-2-luis.hernandez093@gmail.com> <c0cac011-cc07-42f8-bdac-620f3faeebf2@wanadoo.fr>
In-Reply-To: <c0cac011-cc07-42f8-bdac-620f3faeebf2@wanadoo.fr>
From: Felipe Hernandez <luis.hernandez093@gmail.com>
Date: Mon, 21 Jul 2025 23:59:05 -0400
X-Gm-Features: Ac12FXwAZjYe99Ed8fi0EHgmRE6NYfIksS7kFVNneQku7XTz2fKoUAQSeFSHNfQ
Message-ID: <CAGRSKZiZpHm1-EtMsdG5LMUKo6PRgamHpSsEcqDXvcc_PpR5Gw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] docs: Fix kernel-doc indentation errors
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Randy Dunlap <rdunlap@infradead.org>, Pavel Pisa <pisa@cmp.felk.cvut.cz>, 
	Ondrej Ille <ondrej.ille@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-i3c@lists.infradead.org, linux-can@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_205943_161653_601B8450 
X-CRM114-Status: GOOD (  20.39  )
X-Mailman-Approved-At: Tue, 22 Jul 2025 04:10:58 -0700
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

T24gTW9uLCBKdWwgMjEsIDIwMjUgYXQgMzo0OOKAr0FNIFZpbmNlbnQgTWFpbGhvbAo8bWFpbGhv
bC52aW5jZW50QHdhbmFkb28uZnI+IHdyb3RlOgo+Cj4gT24gMjEvMDcvMjAyNSBhdCAwMDoyNCwg
THVpcyBGZWxpcGUgSGVybmFuZGV6IHdyb3RlOgo+ID4gRml4IGtlcm5lbC1kb2MgaXNzdWVzIHRo
YXQgcmVwb3J0ZWQgVW5leHBlY3RlZCBpbmRlbnRhdGlvbiBlcnJvcnMKPiA+IGR1cnJpbmcgZG9j
dW1lbnRhdGlvbiBidWlsZCAobWFrZSBodG1sZG9jcykgaW4gQ0FOLCBJM0MgYW5kIEdQVSBkcml2
ZXJzLgo+ICAgXl5eXl5eXgo+IGR1cmluZwo+Cj4gPiBDb252ZXJ0IGZvcm1hdHRpbmcgdG8gcHJv
cGVyIFJlU1QgbGlzdCBzeW50YXggdG8gcmVzb2x2ZSB3YXJuaW5nLgo+ID4KPiA+IENoYW5nZXMg
c2luY2UgdjE6Cj4gPiAtIENvbnZlcnQgcmV0dXJuIHZhbHVlIGRlc2NyaXB0aW9ucyB0byBwcm9w
ZXIgUmVTVCBmb3JtYXQKPiA+IC0gRml4IGNvZGUgYmxvY2sgaW50cm9kdWN0aW9uIHdpdGggOjog
c3ludGF4Cj4gPiAtIEFkZCBHUFUgZHJpdmVyIGZpeGVzCj4gPiAtIFJlbW92ZSBTQ1NJIGRyaXZl
ciAoYWxyZWFkeSBmaXhlZClBdAo+Cj4gVGhlIGNoYW5nZSBsb2cgZG9lcyBub3QgbmVlZCB0byBh
cHBlYXIgaW4gdGhlIHBhdGNoIG1haW4gYm9keS4KPgo+IEFkZCBhIC0tLSBjdXR0ZXIgYWZ0ZXIg
eW91ciBzaWduYXR1cmUgYW5kIHB1dCB0aGUgY2hhbmdlIGxvZyBhZnRlciB0aGF0IGN1dHRlci4K
PiBUaGlzIHdheSwgdGhlIGNoYW5nZSBsb2cgd2lsbCBhdXRvbWF0aWNhbGx5IGJlIGRpc2NhcmRl
ZCB3aGVuIHRoZSBwYXRjaCBpcyBwaWNrZWQuCj4KPiA+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDI1MDcwMzAyMzUxMS44Mjc2OC0xLWx1aXMuaGVybmFuZGV6MDkzQGdtYWls
LmNvbS8KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBMdWlzIEZlbGlwZSBIZXJuYW5kZXogPGx1aXMu
aGVybmFuZGV6MDkzQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1f
Z3B1dm0uYyAgICAgICAgICAgICAgfCAxNiArKysrKysrKy0tLS0tLS0tCj4gPiAgZHJpdmVycy9p
M2MvZGV2aWNlLmMgICAgICAgICAgICAgICAgICAgICB8IDEzICsrKysrKysrLS0tLS0KPiA+ICBk
cml2ZXJzL25ldC9jYW4vY3R1Y2FuZmQvY3R1Y2FuZmRfYmFzZS5jIHwgMTIgKysrKysrKy0tLS0t
Cj4KPiBDYW4geW91IGRvIG9uZSBwYXRjaCBwZXIgc3ViLWRvbWFpbnMgYW5kIHNlbmQgdGhlbSBz
ZXBhcmF0ZWx5PyBUaGUgbWFpbnRhaW5lcnMKPiBvZiBkcml2ZXJzL2kzYy8gYXJlIG5vdCB0aGUg
c2FtZSBhcyB0aGUgbWFpbnRhaW5lcnMgb2YgZHJpdmVycy9uZXQvY2FuLy4gQW5kCj4gdGhlcmUg
aXMgbm8gZGVwZW5kZW5jaWVzIHByZXZlbnRpbmcgeW91IHRvIHNwbGl0Lgo+Cj4KPiBZb3VycyBz
aW5jZXJlbHksCj4gVmluY2VudCBNYWlsaG9sCj4KCkhpIFZpbmNlbnQsCgpUaGFuayB5b3UgZm9y
IHRha2luZyB0aW1lIHRvIHJldmlldyBteSB2MiBwYXRjaCBhbmQgZm9yIHRoZSBmZWVkYmFjay4K
SSBoYXZlIHNpbmNlIGFwcGxpZWQgdGhlIGNoYW5nZXMgeW91IHN1Z2dlc3RlZC4gSSBhcG9sb2dp
emUgYWJvdXQKbWl4aW5nIHRoZSBzdWItZG9tYWlucywgYXQgZmlyc3QgSSB0aG91Z2h0IHRoZXkg
d291bGQgYWxsIGJlIHJlbGF0ZWQKYXMgYmVpbmcgcGFydCBvZiB0aGUgZG9jdW1lbnRhdGlvbiBz
dWJzeXN0ZW0gc2luY2UgdGhleSB3ZXJlIHJlcG9ydGluZwphIHNpbWlsYXIgZXJyb3IgYnV0IEkg
bm93IHVuZGVyc3RhbmQgdGhlc2Ugd2VyZW4ndCBkb2N1bWVudGF0aW9uCnJlbGF0ZWQgcGVyLXNl
IGFuZCBzaG91bGQndmUgZ29uZSB0byBlYWNoIG9mIHRoZSBzdWItZG9tYWlucwpzZXBhcmF0ZWx5
IGFzIHRoZSBjaGFuZ2VzIHdlcmUgbWFkZSBpbiB0aGUgc291cmNlcy4KCkFnYWluLCBJIGFwcHJl
Y2lhdGUgdGhlIGd1aWRhbmNlIQoKQmVzdCwKCkZlbGlwZQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5n
IGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
