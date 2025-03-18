Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CC1C28B28
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Mar 2025 15:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=atn1xYiL1ZvL65cWzZhPWzXtk/HXzxHVbPndliEHJvw=; b=l2OYn1Kw72UwqS
	f09CJNhWli0SZfZwWnxtWKCh+SXiKqUUyta3dCg1LYtRal2XuYzF9o2bCyfbMa040PV4ISARcTnMZ
	6SPlXEV4h9h17QRv53shHvmidb/ggQuIMe5M56uyQHenT4Bp8Yo76zJe13iV5PwJFVcCpf1rHiAaM
	RoOew1UVVNfwE3iDHmLqqGJhlVuv8zA2seS0/59ogj5kBnUzdnEHAWvIQWFFkfQqoQ46WoZ/sQH0f
	MywtHjYr0HQ7fiN1cBfR5Lo6VWFgXxt/XQ2M3i1QCexi2XbPSk8yt4Mjp7qNXGun0yoKMPzAJEzQA
	zsJ8BZUgkqPUtDTChosQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZEG-00000006PsJ-2YSM;
	Tue, 18 Mar 2025 15:51:44 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuY8w-00000006DRq-2RMr
	for linux-i3c@lists.infradead.org;
	Tue, 18 Mar 2025 14:42:11 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso4298080f8f.1
        for <linux-i3c@lists.infradead.org>; Tue, 18 Mar 2025 07:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742308928; x=1742913728; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FiuJGenS9r4gN4igDCUFwLVXGDsRuGko4IS+9Bv5L2M=;
        b=jOQDBq+DhN64IcuPQXCz5m6ELk9SIl8bFW6lwhOpoZUCV13BLqonysiHGwXL6lJN74
         0SVID1YmU2zuj+4Y9TVx6IB3/Ny6tGOw2zQbgA3w7JANI2Kp5czRIbobwB6dsYajipjk
         vcgdNZK/JezoBJY84jIzkd50Ei/50CvdmlOuwWxBiX45hukR4+so4hkmhpMclqFB72cx
         RqIwMx31YdvXIelX9Fs2BNrQ0qsvyozjWFQP3oL9dTweSMUoITqF8C/bMRe8s4dAcJpO
         Nv4g04DWbOHWsyiy7NKduFkRTrywzqIE4pZeOCYuKn+6dQHC6VU2BSNMcU8hS/RO1Fqe
         3mWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742308928; x=1742913728;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FiuJGenS9r4gN4igDCUFwLVXGDsRuGko4IS+9Bv5L2M=;
        b=iyrEnGjzkpiDWv6CIutCkuAwHBRkXDtOOEkgB6cpBEb4377Z6EiS/F9+0uW42b/4MH
         daPP0YL4JoTC1zF7oN5SPQlR34tt8h2j+rcGYN8nj0EtNMu2Kf8BZFmwlT2lSH56bCbd
         5n2dqPZIvrILnEvVzQsgtHik9leYFjIPZQNFDlBWIdRYFQLhhPVPze28g1J5VZD2UkLP
         SWvJq2f7ypHOYJ7F3MvixkD1Vr5pO9HKK3wqyS0Bnz83/nFhv4LMifwe6wvJffoTnWCn
         2qHnKy/oVkqDw25+qyJlFoVma7EZpsAcOBn5DQ7UzXHGU05PPt12NXS2u4+F34bACW8D
         kz9A==
X-Forwarded-Encrypted: i=1; AJvYcCVqPbn/Ev07Wpzo8JV+TLpmQpTm5p385Qqz1Br2f0dcdNrfx0KJBJO83fx+AZgPfvdW4NXtjNNGOZ8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzytdwttiiC3PuYNhNbVIGywcFbeRPY7jotn2rm2UftKueL3Zyp
	EPxGM/BJ3AZCAalHeCADezxpaEnSBm/vlgypdeAsVSE0uHNlJPmN
X-Gm-Gg: ASbGncvkN4AlFsQ4ZQESOJYPNFSgB1iJ9q5Tq8B8EeReZLJSvYYxPxuikgYQd375v5Y
	DOZGJAYbn9mpgoAaNxQbAfZCI+tUmHxT17OQkCRP2lng9FPcADz/GMQuMvETWCZpEl/oZzgxCjX
	HFRxl416/tbKd9O/hsbhe8aOZWkCPxvrUZYTBLdHMq5+wMmHK7PTkoXHPLtYotf8RGKjzMWRXVT
	XzvlIsP2HG2h352cQnE9TZqYYXRyTq/aHNqWlCzlU4E6sVn0jhdsGG0laKSBXac2V6L0aI0auNC
	TS0yaeRAHo2xGS+VwQdAZDjp2QWeiPysjEXNAyeKl/M5w+o=
X-Google-Smtp-Source: AGHT+IHLX8HZZ+2Wci446kRf3mvfpCskR7WDvTO3CsK1JjrNl/z1w3XNrCzriB+PrYbZGTzvp1a7CQ==
X-Received: by 2002:a5d:5986:0:b0:391:386d:5971 with SMTP id ffacd0b85a97d-3996bb51fb8mr3191605f8f.14.1742308928282;
        Tue, 18 Mar 2025 07:42:08 -0700 (PDT)
Received: from qasdev.system ([2a02:c7c:6696:8300:c99:9d6f:1130:510f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7ebbc3sm18157908f8f.88.2025.03.18.07.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 07:42:07 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:41:47 +0000
From: Qasim Ijaz <qasdev00@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: svc: fix signed/unsigned mismatch in
 dynamic address assignment
Message-ID: <Z9mGK0x8fsWvbTvo@qasdev.system>
References: <20250317101516.19157-1-qasdev00@gmail.com>
 <Z9l3waI5EdrWmYC3@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z9l3waI5EdrWmYC3@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_074210_622580_07D048C1 
X-CRM114-Status: GOOD (  26.37  )
X-Mailman-Approved-At: Tue, 18 Mar 2025 08:49:19 -0700
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

T24gVHVlLCBNYXIgMTgsIDIwMjUgYXQgMDk6NDA6MTdBTSAtMDQwMCwgRnJhbmsgTGkgd3JvdGU6
Cj4gT24gTW9uLCBNYXIgMTcsIDIwMjUgYXQgMTA6MTU6MTZBTSArMDAwMCwgUWFzaW0gSWpheiB3
cm90ZToKPiA+IHN2Y19pM2NfbWFzdGVyX2RvX2RhYV9sb2NrZWQoKSBkZWNsYXJlcyBkeW5fYWRk
ciBhcyBhbiB1bnNpZ25lZCBpbnQKPiA+IGhvd2V2ZXIgaXQgaW5pdGlhbGlzZXMgaXQgd2l0aCBp
M2NfbWFzdGVyX2dldF9mcmVlX2FkZHIoKSB3aGljaAo+ID4gcmV0dXJucyBhIHNpZ25lZCBpbnQg
dHlwZSBhbmQgdGhlbiBhdHRlbXB0cyB0byBjaGVjayBpZiBkeW5fYWRkciBpcwo+ID4gbGVzcyB0
aGFuIDAuIFVuc2lnbmVkIGludGVnZXJzIGNhbm5vdCBiZSBsZXNzIHRoYW4gMCwgc28gdGhlIGNo
ZWNrCj4gPiBpcyBlc3NlbnRpYWxseSByZWR1bmRhbnQuIEZ1cnRoZXJtb3JlIGkzY19tYXN0ZXJf
Z2V0X2ZyZWVfYWRkcigpCj4gPiBjb3VsZCByZXR1cm4gLUVOT01FTSB3aGljaCBhbiB1bnNpZ25l
ZCBpbnQgY2Fubm90IHN0b3JlLgo+ID4KPiA+IEZpeCB0aGlzIGJ5IGNhcHR1cmluZyB0aGUgcmV0
dXJuIHZhbHVlIG9mIGkzY19tYXN0ZXJfZ2V0X2ZyZWVfYWRkcigpCj4gPiBpbiBhIHNpZ25lZCBp
bnQg4oCYZHluX2FkZHJfcmV04oCZLiBJZiB0aGF0IHZhbHVlIGlzIG5lZ2F0aXZlLCByZXR1cm4K
PiA+IGFuIGVycm9yLiBPdGhlcndpc2UsIGFzc2lnbiBpdCB0byB0aGUgdW5zaWduZWQgaW50IOKA
mGR5bl9hZGRy4oCZIG9uY2UKPiA+IHdlIGtub3cgaXTigJlzIHZhbGlkLgo+ID4KPiA+IEZpeGVz
OiA0MDA4YTc0ZTBmOWIgKCJpM2M6IG1hc3Rlcjogc3ZjOiBGaXggbnBjbTg0NSBGSUZPIGVtcHR5
IGlzc3VlIikKPiA+IFNpZ25lZC1vZmYtYnk6IFFhc2ltIElqYXogPHFhc2RldjAwQGdtYWlsLmNv
bT4KPiA+IC0tLQo+IAo+IFRoYW5rIHlvdSBmb3IgeW91ciBwYXRjaCwgYnV0IHNpbWlsYXIgb25l
IHdhcyBhbHJlYWR5IGFwcGxpZWQKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1pM2Mv
MTc0MjI1MTU4MjEwLjE1OTM2MTAuMTAwMTg4MTI3ODA3MzE4NDk0MDkuYjQtdHlAYm9vdGxpbi5j
b20vVC8jbTUxMjBlMWMzNjJlN2U1N2Y0Y2FiMTM5YTQ1NDEwZmRlNDIxYzJmMzcKPgoKSGkgRnJh
bmsgCiAKSSBzZW50IGEgZml4IGZvciB0aGlzIGlzc3VlIG9uIHRoZSA5dGggTWFyY2gsIHdoaWNo
IGlzIGJlZm9yZSB0aGUgcGF0Y2gKeW91IGxpbmtlZCB3aGljaCB3YXMgc2VudCBvbiB0aGUgMTB0
aCBNYXJjaC4KCllvdSBjYW4gdmlldyBteSBvcmlnbmFsIHBhdGNoIGhlcmU6CgpodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyNTAzMDkxNjQzMTQuMTUwMzktMS1xYXNkZXYwMEBnbWFpbC5j
b20vCgpUaGFua3MKUWFzaW0KPiBGcmFuawo+ID4gIGRyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNj
LW1hc3Rlci5jIHwgNSArKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9z
dmMtaTNjLW1hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiA+
IGluZGV4IGYyMmZiOWU3NTE0Mi4uZWVhMDhmMDBkN2NlIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiA+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rl
ci9zdmMtaTNjLW1hc3Rlci5jCj4gPiBAQCAtOTk4LDkgKzk5OCwxMCBAQCBzdGF0aWMgaW50IHN2
Y19pM2NfbWFzdGVyX2RvX2RhYV9sb2NrZWQoc3RydWN0IHN2Y19pM2NfbWFzdGVyICptYXN0ZXIs
Cj4gPiAgCQkJICogZmlsbGluZyB3aXRoaW4gYSBmZXcgaHVuZHJlZCBuYW5vc2Vjb25kcywgd2hp
Y2ggaXMgc2lnbmlmaWNhbnRseQo+ID4gIAkJCSAqIGZhc3RlciBjb21wYXJlZCB0byB0aGUgNjQg
U0NMIGNsb2NrIGN5Y2xlcy4KPiA+ICAJCQkgKi8KPiA+IC0JCQlkeW5fYWRkciA9IGkzY19tYXN0
ZXJfZ2V0X2ZyZWVfYWRkcigmbWFzdGVyLT5iYXNlLCBsYXN0X2FkZHIgKyAxKTsKPiA+IC0JCQlp
ZiAoZHluX2FkZHIgPCAwKQo+ID4gKwkJCWludCBkeW5fYWRkcl9yZXQgPSBpM2NfbWFzdGVyX2dl
dF9mcmVlX2FkZHIoJm1hc3Rlci0+YmFzZSwgbGFzdF9hZGRyICsgMSk7Cj4gPiArCQkJaWYgKGR5
bl9hZGRyX3JldCA8IDApCj4gPiAgCQkJCXJldHVybiAtRU5PU1BDOwo+ID4gKwkJCWR5bl9hZGRy
ID0gZHluX2FkZHJfcmV0Owo+ID4KPiA+ICAJCQl3cml0ZWwoZHluX2FkZHIsIG1hc3Rlci0+cmVn
cyArIFNWQ19JM0NfTVdEQVRBQik7Cj4gPgo+ID4gLS0KPiA+IDIuMzkuNQo+ID4KCi0tIApsaW51
eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
