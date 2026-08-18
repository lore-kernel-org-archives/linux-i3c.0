Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E326C5DF70
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Aug 2026 07:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T1nC/zwcFGZfpO7mOHeTFr1z3ko5dtgU9aRefSq8elE=; b=yjzwNoNY7YTbyi
	Cpe/FXu3fJf0cwMfOfVp0DW986lNG5qZxdUhc6LFABhJhRyj7x7hYhk1PpDNPIXS3PwEoiVwNEoip
	2pBcFDYTjUFw4gg3x4kU4zQMRbPikdPe1WEEBrl3KNUZ0R+nIPaStFPdjAACaUaxru5zdZdwoBdyD
	O8J91zSJNMX30sZbN530AFYdcMQPj1nLOdjWylQt/jT+ksoKWEqslBUldAEeQeXNLYCGVOdrUOtUG
	p45QoIazh2W/DcfTude6RODLGNwhFD2tUQcxwESa45NSk5brQEDYbHFMqQ9ifwlQQdts4PXGGzRVD
	4bmtcAJwkYcnjvpik1bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwE3K-00000007Ras-2MO0;
	Tue, 18 Aug 2026 07:16:06 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwE3I-00000007RaV-12CW
	for linux-i3c@lists.infradead.org;
	Tue, 18 Aug 2026 07:16:05 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-38e58034d05so3287221a91.2
        for <linux-i3c@lists.infradead.org>; Tue, 18 Aug 2026 00:16:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787037363; cv=none;
        d=google.com; s=arc-20260327;
        b=A+zV3SdDrNCSFClrenKNKFJrT1xWohiRfJm9fSnpilwnjL0q2FU/z3Gnh/1ImbpT1r
         vCrg2ZTZ8uA3n7szNLE6XUqnkWxp3u7jmktMLbmCpayZ6/0g0bOp3218Ha2ItY7fAxOh
         MGwdz3MYjdKWDObd/S8rLODL+XTRWkg73IBuSAkyI+z0XtZgie6Wh+yVTv8QFGQ5ghCr
         xfyD2nVbV1H7NA2PsT3SdpwoFN8XhFVTrT+4JVmtmXr/Xx1BImVsUEnG0TlcJ8CjVGfE
         8Sx6ByFHxFidF1XS8gi2kcH1jF2CatQ+jZM9p4vtiKiy+T0+wJXCQw8V9LBLmzMP9WRX
         JJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AQRhExR3MdYk/Dto6oskFjqvERfi0a2wGS7mgw1umo0=;
        fh=qGq5+W90+jJth19eQptLbbnUQTMUzpmpK3Dg40s61SQ=;
        b=OtCP74KqN9vZ9tcgcx52Fn93pyrxCPmc17pZLdoQyxyU8s3EvGoYabxhCo640huRy1
         UyKJnEapni/Q8pVUYHlVBrUNPlG01vOG4t47RqeZZX3Jb6eYmm3+jWp222gVYzcoY+jp
         RWcd3rn/tK+09T5XeXJHZSPw2Of1h+b2STR6aeSleB8I35Y375hqaLF3Q2mKVhgqFyPb
         MxCqfTGCT18f66f88c32tLoelPF99AGswTLastSlEUEpOgEd49JpvLgyAnJ74yIwzqyQ
         jGlYCxW+JsNMVIZadR7Hnt2y0lkcjG6YltnD1TF7FYEjrMVHiYcewQm6ZlbaYckXlBoH
         K4OQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787037363; x=1787642163; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AQRhExR3MdYk/Dto6oskFjqvERfi0a2wGS7mgw1umo0=;
        b=kttiR90ZTV00gSCu6NyM0iPIZB74Jiy6wqY1biwjdXWfoKVhmXDnSHraqrzPsbYBrd
         yOSZE/hkPTagPL92NXvIm5ANLUeKuolbkrqMwLs8CQp2Ca82K8SujCIxZQdKb/imA+rD
         5Kh6VL+IFSWB5P4G0/Z/xLp5Nz0TVGgwWIpOBi/hqCmXYIFw4RaxXUkuVDx8OQtgsg4t
         Sp4/c/QQQrx19dnh1YLBxx5ooyUsiLTVTlM9VX2hsnKl3uLM7AKBhWjGot/bJgizK9OD
         3Hh9NeDLJG2vsh/Ya1uw4Xlywfr+5bQ/vMAmejMyB92poCNF7SwW43VGhK5dwDopinxr
         aPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787037363; x=1787642163;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AQRhExR3MdYk/Dto6oskFjqvERfi0a2wGS7mgw1umo0=;
        b=aHN98eQIc8eMc0zkcNxecx/TJWwNKzs2C9OcQyGobGUrFAwYTfxHsgzPHWhZlCW7Ea
         rLbWDTTnLMiWVvh3wXIbC+xfudKrRPhHn7VLRAxeLryXT60x90DpcD/BSmyuQTEjZEBg
         laYyKxn9Xn17ZCCwk9hxxJqiLuQmkG3tDLE3Ip/GmOzvXyfqB6Hl89hZ+2/UlktEPbRD
         x/ufglWXCvnV4nMjujQCnK9zRzCfCvcMBTQCUAsyUpa4r0mzPnzRGrSqgs4FIlst2RSI
         xrBuBwLx4eaEdM2ogC/NYPOu7niYzxu8A50O17W7Tm+vxaWmmUpnk3q56szEZFGrorcG
         quYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0BwlZImMR7IRARGxO11LgLQkF59++6T8bC7hyZDYsXBfy2bjU3HCDSkcBrgG5Tghkh8Rx8ETyw0s=@lists.infradead.org
X-Gm-Message-State: AOJu0YzMZ8lU9cl2E0NQ3j2eMxoMKsIiLTgcSUPUiwKUxaZHHQ6oD4Iv
	GuIL91n9FN+moBsBpOd39Bomycvs9oz/9QXmMmSTsB3bC4YSITMHaRcst7GGXWrKfV4pncTqw4t
	d085JoXERkRZ7f8426ZCvzuHHh26TogQ=
X-Gm-Gg: AR+sD11hzIfgm6xgVRT3g6kz2DmgcAn7NQwxj2nXjTqSkaIq03OCEdN2WLCjVoctFzq
	YvW/8m1Y+dnju2jonzlhpBQI54sxI66TcAe6Ynv4SJAy87NvrJgyaMaYn8xWjFkMeXCguLKbc8g
	JvjGQhfoW2nMllv6d63zy0wVNgxV4xfKz1AsLlTaLU9lscP4GMkoGrGcbkWGcTe8aJ2IPHfX4+W
	42Sv2c29MgKID2HpexKwqKEgnTklImNhLzLxKE0ML0SHPS5lqqeJWJSLVE/HHBNFbkay1xE4M4V
	hC3Enyv8bVtLFBtBkjJuKJEWBRz8/hQoaQS6AI+bhfNI4A==
X-Received: by 2002:a17:90b:314a:b0:37f:fdc8:71b4 with SMTP id
 98e67ed59e1d1-3955a3dadefmr6839423a91.2.1787037363183; Tue, 18 Aug 2026
 00:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260817082647.612471-1-Jm_Liao@asmedia.com.tw>
 <20260817082647.612471-3-Jm_Liao@asmedia.com.tw> <aoNmFLgWymQeZHn-@lizhi-Precision-Tower-5810>
In-Reply-To: <aoNmFLgWymQeZHn-@lizhi-Precision-Tower-5810>
From: Jian-Ming Liao <tim678910@gmail.com>
Date: Tue, 18 Aug 2026 15:15:51 +0800
X-Gm-Features: AcwNN1XRVx3HPa4fddm-G0ED3dbHfhVAvr4Dxq6l-lxm1euDt10IzcyEtKpkOt8
Message-ID: <CAGfoLndDb=vQauxutuo4opvPn7fWfrnX4UYu_3x++eYZyjCVEw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] i3c: mipi-i3c-hci: Add PIO queue management
 support for HCI v1.2
To: Frank Li <Frank.li@oss.nxp.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, adrian.hunter@intel.com, 
	jarkko.nikula@linux.intel.com, boris.brezillon@collabora.com, 
	linux-i3c@lists.infradead.org, Jm_Liao@asmedia.com.tw, 
	Patrick_Yen@asmedia.com.tw, Chloe_Chen@asmedia.com.tw, 
	Yd_Tseng@asmedia.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_001604_291310_B65F79DC 
X-CRM114-Status: GOOD (  10.87  )
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

T24gVHVlLCBBdWcgMTgsIDIwMjYgYXQgMzo1MCBBTSwgRnJhbmsgTGkgd3JvdGU6Cj4KPiBPbiBN
b24sIEF1ZyAxNywgMjAyNiBhdCAwNDoyNjo0NlBNICswODAwLCBKaWFuLU1pbmcgTGlhbyB3cm90
ZToKPiA+IFN1cHBvcnQgZXhwbGljaXQgZW5hYmxlbWVudCBhbmQgc3RhcnRpbmcgb2YgUElPIHF1
ZXVlcyBhcyByZXF1aXJlZCBieQo+ID4gSENJIHYxLjIuCj4gPiBIYW5kbGUgYWx0ZXJuYXRlIFBJ
TyBxdWV1ZSBzaXplcyB2aWEgQUxUX1FVRVVFX1NJWkUgcmVnaXN0ZXIuCj4gPiBJbXBsZW1lbnQg
ZXhwbGljaXQgUElPIHF1ZXVlIHN0b3BwaW5nL2Rpc2FibGluZyBhbmQgcmVzdGFydCBsb2dpYyBh
ZnRlcgo+ID4gZXJyb3JzLgo+ID4KPiA+IENvLWRldmVsb3BlZC1ieTogUGF0cmljayBZZW4gPFBh
dHJpY2tfWWVuQGFzbWVkaWEuY29tLnR3Pgo+ID4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBZZW4g
PFBhdHJpY2tfWWVuQGFzbWVkaWEuY29tLnR3Pgo+ID4gU2lnbmVkLW9mZi1ieTogSmlhbi1NaW5n
IExpYW8gPEptX0xpYW9AYXNtZWRpYS5jb20udHc+Cj4gPiAtLS0KPiA+IHYzOgo+ID4gIC0gTm8g
ZnVuY3Rpb25hbCBjb2RlIGNoYW5nZXMuCj4gPiAgLSBBbGlnbmVkIEZyb206IGFuZCBTaWduZWQt
b2ZmLWJ5OiBlbWFpbCBhZGRyZXNzZXMgKEFkcmlhbikuCj4KPiBTdGlsbCBtYXRjaCBKaWFuLU1p
bmcgTGlhbyA8dGltNjc4OTEwQGdtYWlsLmNvbT4sCj4gU2lnbmVkLW9mZi1ieTogSmlhbi1NaW5n
IExpYW8gPEptX0xpYW9AYXNtZWRpYS5jb20udHc+Cj4KPiBGcmFuawoKSGkgRnJhbmssCgpUaGFu
a3MgZm9yIGNhdGNoaW5nIHRoaXMg4oCUIHlvdSdyZSByaWdodC4KV2UncmUgY3VycmVudGx5IHJl
bGF5aW5nIHNlbmQtZW1haWwgdGhyb3VnaCBhIHBlcnNvbmFsIEdtYWlsIFNNVFAgc2VydmVyLAph
bmQgaXQgc2VlbXMgR21haWwgaXMgb3ZlcnJpZGluZyB0aGUgRnJvbSBoZWFkZXIgZGVzcGl0ZQp1
c2luZyAtLWZyb20sIGV2ZW4gdGhvdWdoIHRoZSBjaGFuZ2Vsb2cgc2FpZCBpdCB3YXMKYWxpZ25l
ZC4gV2UncmUgYWRkcmVzc2luZyB0aGlzIG9uIG91ciBlbmQgYW5kIEknbGwgcmVzZW5kIGEKY29y
cmVjdGVkIHZlcnNpb24gb25jZSB0aGUgRnJvbSBhbmQgU2lnbmVkLW9mZi1ieQphZGRyZXNzZXMg
YXJlIGNvbnNpc3RlbnQuIFRoYW5rcyBmb3IgeW91ciBwYXRpZW5jZS4KCkJlc3QgcmVnYXJkcywK
Smlhbi1NaW5nIExpYW8KCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtaTNjCg==
