Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D793C3DA7F
	for <linux-i3c@archiver.kernel.org>; Mon,  5 Aug 2024 05:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gCKrS7Ai1itvKDjXwWFmJqdjQOOc4Im1lfdEANAlhtg=; b=GnnKwpq/yiTyZW
	xqbl51J779WZUh0IX5rbYvcXUWpLqC+16VbzhUf+lGAYLfIVkhQH89agzKA5bpFpW/jCTfZ7R/2vu
	XLdUYjF/HXzTcnAFhcd/p6AN0FVxhE4akLWKbsQ/4A96iFfIMT8tWeXC5CCHglaWyrl7Dzf+dOMvf
	6NH1zT9i5DODXGgWPFjVEmgGWIiumalB7Az+aXVj8cyL8yQ2gwHYlCvu1/2f6fLPT+K5BXumOgDkN
	lcwF6PZgngcHSVzGGioiZs7mj/CU2H9d7r0BM+Ok4zwuHuKFmVrWcIigOQ7dhW7SizWpsS8e6TER2
	gxZ6INo8OTm9tjaKgHbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saqPw-0000000EiBU-3hvp;
	Mon, 05 Aug 2024 05:38:00 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saqPu-0000000EiB5-0IHx
	for linux-i3c@lists.infradead.org;
	Mon, 05 Aug 2024 05:37:59 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-39b0826297bso2356865ab.2
        for <linux-i3c@lists.infradead.org>; Sun, 04 Aug 2024 22:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722836276; x=1723441076; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6LPkoKlOEYKUBrjkr4bO02YY4lDC/XqBltvUaObBqU=;
        b=m8cipg30bEXvI0onWOgORQQnQC8NfNtve1I6gbZrEwv0xDR2Qo9H4R4PKVwWPNPqWA
         gJvSfoei5GnTt5AMFudWwBlSCgqw4y3LYqJzjPSqWRb0/GCcLR42zEUgbw+/C1C5fwlq
         I+HI614omGZPDKbwFa6frodgEeLb/EQ4QEBUOvIOPUV3V5NDPcoBAMHsmJBP+89/8kLs
         W25nq8BnrlONZ0+DLxkYB3KF1r5sIwtkT//y161iZhrUV4j661BKfQdCm9DwAGyEunE6
         +vbTTUBMfxFRJ7eRyj4UT9cVNxhGCMcXMV5TnaNWlx+AEG8Kdk6vqd4JxMYwQtKTpYYb
         c2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722836276; x=1723441076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6LPkoKlOEYKUBrjkr4bO02YY4lDC/XqBltvUaObBqU=;
        b=J6FpS4+g+2sdlzunI+SIh2Do7KOzUFF/3IuDifit5TTL9uKGQXNxMxb5HPV4iXuw9R
         hEdC5zBIThdgq2pAGYGd0jqisvmjP2ObKFkxkY6HOx8z68BtRTnv9rF2pUsiyjWfrAtn
         /96RIt3MtNHm4Qgzd5YxTFo0TXHVDXbvPHeNhfpEMKXSS4igsJlbFP7CnVgsBfI8jdRY
         kI73+zelgT8SJoQOlF/ErNmUdvUgGuwmsXt6w6W70z0ItGA3HHZikNA18xdcoRpnNEYt
         Vbkv364t62pAyvHvOQvAJXobkQyj90xV+sKbBQpYWWKyfvjtDQfwnk9hlYEE1hblT4RR
         ETjg==
X-Forwarded-Encrypted: i=1; AJvYcCUcCbzPE8x7atVrpLDXEqd6/zSuTOPvwRALwz3Ugd/GHN9ICWWG6ML76cap8SD5/oms7cLKlAfdjsE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvio+EoO1nW0DBeRSYFAaZNMETaSHIZfo/garGcKfrBwe0zoVR
	RIsHfG/++9yqvTStdmt2sDjpFwboIfw7I7remoiNNNIj2mn3A4er8oBx7+KYawVj8YV/McTWJQJ
	K4oAoBVNhxByryUvqcQpgsT2pplI=
X-Google-Smtp-Source: AGHT+IF198sb+5kT2eiO9NKzgM6Ilhavu7WvWLEWhaEmOkSuz261ZvEEAdm5+8XB9cazevhD1uwMxwhdqfWbhBsPuZY=
X-Received: by 2002:a05:6e02:1a49:b0:383:17f9:6223 with SMTP id
 e9e14a558f8ab-39b1fb79763mr67942385ab.2.1722836276215; Sun, 04 Aug 2024
 22:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240801071946.43266-1-yschu@nuvoton.com> <20240801071946.43266-2-yschu@nuvoton.com>
 <c3ee7783-6891-4917-9935-21d46d8ac9a7@kernel.org> <202408012306316257ee23@mail.local>
In-Reply-To: <202408012306316257ee23@mail.local>
From: Stanley Chu <stanley.chuys@gmail.com>
Date: Mon, 5 Aug 2024 13:37:45 +0800
Message-ID: <CAPwEoQP=++bopg2V2_fqogvM0J1oXX9179CTLA=ZHf3Paegu0g@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: i3c: Add NPCM845 i3c controller
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org, krzk+dt@kernel.org, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com, 
	cpchiang1@nuvoton.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240804_223758_137628_F9FCCEF6 
X-CRM114-Status: GOOD (  29.61  )
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

QWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPiDmlrwgMjAy
NOW5tDjmnIgy5pelIOmAseS6lCDkuIrljYg3OjA35a+r6YGT77yaCj4KPiBPbiAwMS8wOC8yMDI0
IDE2OjUzOjUyKzAyMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gPiBPbiAwMS8wOC8y
MDI0IDA5OjE5LCBTdGFubGV5IENodSB3cm90ZToKPiA+ID4gVGhlIG5wY204NDUgaTNjIGRldmlj
ZXRyZWUgYmluZGluZyBmb2xsb3dzIHRoZSBiYXNpYyBpM2MgYmluZGluZ3MKPiA+ID4gYW5kIGFk
ZCB0aGUgcHJvcGVydGllcyBmb3IgYWxsb3dpbmcgdG8gYWRqdXN0IHRoZSBTREEvU0NMIHRpbWlu
Zwo+ID4gPiB0byBtZWV0IGRpZmZlcmVudCByZXF1aXJlbWVudHMuCj4gPiA+Cj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IFN0YW5sZXkgQ2h1IDx5c2NodUBudXZvdG9uLmNvbT4KPiA+ID4gU2lnbmVkLW9m
Zi1ieTogSmFtZXMgQ2hpYW5nIDxjcGNoaWFuZzFAbnV2b3Rvbi5jb20+Cj4gPiA+IC0tLQo+ID4g
PiAgLi4uL2JpbmRpbmdzL2kzYy9udXZvdG9uLGkzYy1tYXN0ZXIueWFtbCAgICAgIHwgMTIzICsr
KysrKysrKysrKysrKysrKwo+ID4KPiA+IFVzZSBjb21wYXRpYmxlIGFzIGZpbGVuYW1lLiBBbnl3
YXkgd29yZCAibWFzdGVyIiB3YXMgZHJvcHBlZC4KPiA+Cj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MTIzIGluc2VydGlvbnMoKykKPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvaTNjL251dm90b24saTNjLW1hc3Rlci55YW1sCj4gPiA+Cj4g
PiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL251
dm90b24saTNjLW1hc3Rlci55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2kzYy9udXZvdG9uLGkzYy1tYXN0ZXIueWFtbAo+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmE0MGIzN2IxNjg3Mgo+ID4gPiAtLS0gL2Rldi9udWxs
Cj4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MvbnV2b3Rv
bixpM2MtbWFzdGVyLnlhbWwKPiA+ID4gQEAgLTAsMCArMSwxMjMgQEAKPiA+ID4gKyMgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UKPiA+ID4gKyVZ
QU1MIDEuMgo+ID4gPiArLS0tCj4gPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hl
bWFzL2kzYy9udXZvdG9uLGkzYy1tYXN0ZXIueWFtbCMKPiA+ID4gKyRzY2hlbWE6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ID4gPiArCj4gPiA+ICt0aXRs
ZTogTnV2b3RvbiBOUENNODQ1IEkzQyBtYXN0ZXIKPiA+Cj4gPiBVc2UgbmV3IHRlcm1pbm9sb2d5
LiBTaW5jZSAyMDIxIHRoZXJlIHdhcyBhIGNoYW5nZS4uLiB0aHJlZSB5ZWFycyBhZ28uCj4gPgo+
ID4gPiArCj4gPiA+ICttYWludGFpbmVyczoKPiA+ID4gKyAgLSBTdGFubGV5IENodSA8eXNjaHVA
bnV2b3Rvbi5jb20+Cj4gPiA+ICsgIC0gSmFtZXMgQ2hpYW5nIDxjcGNoaWFuZzFAbnV2b3Rvbi5j
b20+Cj4gPiA+ICsKPiA+ID4gK2FsbE9mOgo+ID4gPiArICAtICRyZWY6IGkzYy55YW1sIwo+ID4g
PiArCj4gPiA+ICtwcm9wZXJ0aWVzOgo+ID4gPiArICBjb21wYXRpYmxlOgo+ID4gPiArICAgIGNv
bnN0OiBudXZvdG9uLG5wY204NDUtaTNjCj4gPiA+ICsKPiA+ID4gKyAgcmVnOgo+ID4gPiArICAg
IGl0ZW1zOgo+ID4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogSTNDIHJlZ2lzdGVycwo+ID4gPiAr
ICAgICAgLSBkZXNjcmlwdGlvbjogR0RNQSByZWdpc3RlcnMKPiA+ID4gKyAgICAgIC0gZGVzY3Jp
cHRpb246IEdETUEgcmVxdWVzdCBjb250cm9sIHJlZ2lzdGVyCj4gPiA+ICsKPiA+ID4gKyAgcmVn
LW5hbWVzOgo+ID4gPiArICAgIGl0ZW1zOgo+ID4gPiArICAgICAgLSBjb25zdDogaTNjCj4gPiA+
ICsgICAgICAtIGNvbnN0OiBkbWEKPiA+ID4gKyAgICAgIC0gY29uc3Q6IGRtYV9jdGwKPiA+ID4g
Kwo+ID4gPiArICBpbnRlcnJ1cHRzOgo+ID4gPiArICAgIG1heEl0ZW1zOiAxCj4gPiA+ICsKPiA+
ID4gKyAgY2xvY2tzOgo+ID4gPiArICAgIGl0ZW1zOgo+ID4gPiArICAgICAgLSBkZXNjcmlwdGlv
bjogc3lzdGVtIGNsb2NrCj4gPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBidXMgY2xvY2sKPiA+
ID4gKwo+ID4gPiArICBjbG9jay1uYW1lczoKPiA+ID4gKyAgICBpdGVtczoKPiA+ID4gKyAgICAg
IC0gY29uc3Q6IHBjbGsKPiA+ID4gKyAgICAgIC0gY29uc3Q6IGZhc3RfY2xrCj4gPiA+ICsKPiA+
ID4gKyAgcmVzZXRzOgo+ID4gPiArICAgIG1heEl0ZW1zOiAxCj4gPiA+ICsKPiA+ID4gKyAgaTNj
LXBwLXNjbC1oaS1wZXJpb2QtbnM6Cj4gPiA+ICsgICAgZGVzY3JpcHRpb246IHwKPiA+Cj4gPiBE
byBub3QgbmVlZCAnfCcgdW5sZXNzIHlvdSBuZWVkIHRvIHByZXNlcnZlIGZvcm1hdHRpbmcuCj4g
Pgo+ID4gPiArICAgICAgSWYgbmVlZCB0byBjb25maWd1cmUgU0NMIHdpdGggcmVxdWlyZWQgZHV0
eSBjeWNsZSwgc3BlY2lmeSB0aGUgY2xvY2sgaGlnaC9sb3cgcGVyaW9kIGRpcmVjdGx5Lgo+ID4g
PiArICAgICAgaTNjLXBwLXNjbC1oaS1wZXJpb3MtbnMgc3BlY2lmaWVzIHRoZSBoaWdoIHBlcmlv
ZCBucyBvZiB0aGUgU0NMIGNsb2NrIGN5Y2xlIGluIHB1c2ggcHVsbCBtb2RlCj4gPiA+ICsgICAg
ICBXaGVuIGkzYy1wcC1zY2wtaGktcGVyaW9kLW5zIGFuZCBpM2MtcHAtc2NsLWxvLXBlcmlvZC1u
cyBhcmUgc3BlY2lmaWVkLCB0aGUgaTNjIHBwIGZyZXF1ZW5jeSBpcwo+ID4gPiArICAgICAgZGVj
aWRlZCBieSB0aGVzZSB0d28gcHJvcGVydGllcy4KPiA+Cj4gPiBXcmFwIGFjY29yZGluZyB0byBM
aW51eCBDb2RpbmcgU3R5bGUgKGFuZCByZWFkIGNvZGluZyBzdHlsZSB0byBmaWd1cmUKPiA+IHRo
ZSBwcm9wZXIgd3JhcHBpbmcuLi4pLgo+ID4KPiA+ID4gKwo+ID4gPiArICBpM2MtcHAtc2NsLWxv
LXBlcmlvZC1uczoKPiA+ID4gKyAgICBkZXNjcmlwdGlvbjogfAo+ID4gPiArICAgICAgVGhlIGxv
dyBwZXJpb2QgbnMgb2YgdGhlIFNDTCBjbG9jayBjeWNsZSBpbiBwdXNoIHB1bGwgbW9kZS4gaTNj
LXBwLXNjbC1sby1wZXJpb2QtbnMgc2hvdWxkIG5vdAo+ID4gPiArICAgICAgYmUgbGVzcyB0aGFu
IGkzYy1wcC1zY2wtaGktcGVyaW9kLW5zIGFuZCB0aGUgbWF4aW1hbCB2YWx1ZSBpcyBpM2MtcHAt
c2NsLWhpLXBlcmlvZC1ucyArIDE1MC4KPiA+Cj4gPiBFdmVyeXdoZXJlOiBkZWZhdWx0cywgY29u
c3RyYWludHMuCj4gPgo+ID4gPiArCj4gPiA+ICsgIGkzYy1wcC1zZGEtcmQtc2tldzoKPiA+ID4g
KyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKPiA+ID4g
KyAgICBkZXNjcmlwdGlvbjogfAo+ID4gPiArICAgICAgVGhlIG51bWJlciBvZiBNQ0xLIGNsb2Nr
IHBlcmlvZHMgdG8gZGVsYXkgdGhlIFNEQSB0cmFuc2l0aW9uIGZyb20gdGhlIFNDTCBjbG9jayBl
ZGdlIGF0IHB1c2gKPiA+ID4gKyAgICAgIHB1bGwgb3BlcmF0aW9uIHdoZW4gdHJhbnNmZXJzIGkz
YyBwcml2YXRlIHJlYWQuCj4gPiA+ICsgICAgbWF4aW11bTogNwo+ID4gPiArICAgIGRlZmF1bHQ6
IDAKPiA+ID4gKwo+ID4gPiArICBpM2MtcHAtc2RhLXdyLXNrZXc6Cj4gPiA+ICsgICAgJHJlZjog
L3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gPiA+ICsgICAgZGVzY3Jp
cHRpb246IHwKPiA+ID4gKyAgICAgIFRoZSBudW1iZXIgb2YgTUNMSyBjbG9jayBwZXJpb2RzIHRv
IGRlbGF5IHRoZSBTREEgdHJhbnNpdGlvbiBmcm9tIHRoZSBTQ0wgY2xvY2sgZWRnZSBhdCBwdXNo
Cj4gPiA+ICsgICAgICBwdWxsIG9wZXJhdGlvbiB3aGVuIHRyYW5zZmVycyBpM2MgcHJpdmF0ZSB3
cml0ZS4KPiA+ID4gKyAgICBtYXhpbXVtOiA3Cj4gPiA+ICsgICAgZGVmYXVsdDogMAo+ID4gPiAr
Cj4gPiA+ICsgIGkzYy1vZC1zY2wtaGktcGVyaW9kLW5zOgo+ID4gPiArICAgIGRlc2NyaXB0aW9u
OiB8Cj4gPiA+ICsgICAgICBUaGUgaTNjIG9wZW4gZHJhaW4gZnJlcXVlbmN5IGlzIDFNSHogYnkg
ZGVmYXVsdC4KPiA+ID4gKyAgICAgIElmIG5lZWQgdG8gdXNlIGRpZmZlcmVudCBmcmVxdWVuY3ks
IHNwZWNpZnkgdGhlIGNsb2NrIGhpZ2gvbG93IHBlcmlvZCBkaXJlY3RseS4KPiA+ID4gKyAgICAg
IGkzYy1vZC1zY2wtaGktcGVyaW9zLW5zIHNwZWNpZmllcyB0aGUgaGlnaCBwZXJpb2QgbnMgb2Yg
dGhlIFNDTCBjbG9jayBjeWNsZSBpbiBvcGVuIGRyYWluIG1vZGUuCj4gPiA+ICsgICAgICBXaGVu
IGkzYy1vZC1zY2wtaGktcGVyaW9kLW5zIGFuZCBpM2Mtb2Qtc2NsLWxvLXBlcmlvZC1ucyBhcmUg
c3BlY2lmaWVkLCB0aGUgaTNjIG9kIGZyZXF1ZW5jeSBpcwo+ID4gPiArICAgICAgZGVjaWRlZCBi
eSB0aGVzZSB0d28gcHJvcGVydGllcy4KPiA+ID4gKyAgICAgIGkzYy1vZC1zY2wtaGktcGVyaW9k
LW5zIHNob3VsZCBiZSBlcXVhbCB0byBpM2MtcHAtc2NsLWhpLXBlcmlvZC1ucyBvciBpM2Mtb2Qt
c2NsLWxvLXBlcmlvZC1ucy4KPiA+ID4gKwo+ID4gPiArICBpM2Mtb2Qtc2NsLWxvLXBlcmlvZC1u
czoKPiA+ID4gKyAgICBkZXNjcmlwdGlvbjogfAo+ID4gPiArICAgICAgVGhlIGxvdyBwZXJpb2Qg
bnMgb2YgdGhlIFNDTCBjbG9jayBjeWNsZSBpbiBvcGVuIGRyYWluIG1vZGUuIGkzYy1vZC1zY2wt
bG8tcGVyaW9kLW5zIHNob3VsZCBiZQo+ID4gPiArICAgICAgbXVsdGlwbGUgb2YgaTNjLXBwLXNj
bC1oaS1wZXJpb2QtbnMuCj4gPiA+ICsKPiA+ID4gKyAgZW5hYmxlLWhqOgo+ID4gPiArICAgIHR5
cGU6IGJvb2xlYW4KPiA+ID4gKyAgICBkZXNjcmlwdGlvbjogfAo+ID4gPiArICAgICAgRW5hYmxl
IFNMVlNUQVJUIGludGVycnVwdCBmb3IgcmVjZWl2aW5nIGhvdC1qb2luIHJlcXVlc3QuCj4gPgo+
ID4gWW91IGRlc2NyaWJlZCB0aGUgZGVzaXJlZCBMaW51eCBmZWF0dXJlIG9yIGJlaGF2aW9yLCBu
b3QgdGhlIGFjdHVhbAo+ID4gaGFyZHdhcmUuIFRoZSBiaW5kaW5ncyBhcmUgYWJvdXQgdGhlIGxh
dHRlciwgc28gaW5zdGVhZCB5b3UgbmVlZCB0bwo+ID4gcmVwaHJhc2UgdGhlIHByb3BlcnR5IGFu
ZCBpdHMgZGVzY3JpcHRpb24gdG8gbWF0Y2ggYWN0dWFsIGhhcmR3YXJlCj4gPiBjYXBhYmlsaXRp
ZXMvZmVhdHVyZXMvY29uZmlndXJhdGlvbiBldGMuCj4gPgo+Cj4gVGhpcyBoYXMgdG8gYmUgcnVu
dGltZSBjb25maWd1cmFibGUsIHNlZSBob3Rqb2luIGluCj4gaHR0cHM6Ly93d3cua2VybmVsLm9y
Zy9kb2MvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1idXMtaTNjCj4KSGkgQWxleGFu
ZHJlLApUaGFua3MgZm9yIHRoZSByZXZpZXcuCkkgd2lsbCByZW1vdmUgdGhpcyBwcm9wZXJ0eSBh
bmQgZm9sbG93IHRoZSBzeXNmcyBtZXRob2QuCgo+Cj4gLS0KPiBBbGV4YW5kcmUgQmVsbG9uaSwg
Y28tb3duZXIgYW5kIENPTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5n
aW5lZXJpbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlz
dApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
