Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C19CA0FED
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Aug 2025 00:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2kP+bNwW6+7MoKececgg+hwgInDBr4hx1hPdUrYxxrU=; b=I7eUH+ZGXDUSP/
	eAE3/M+O6RJLmYLFQksMfzdZ5xcQKaTqYH6F54Ar6epcL6DFDTsgjsckgTdsebuLyPcJph6DEAJYG
	tec4HxLlJwMTQ3pnw+5t5eZhnbawYA2Fq956S55vkQaj4BohWClqv5NnanFDOUPJU8p4kpcYN8s8k
	yu958Gv1f+Kgt1Q4+2HoletfjsDoM+9V5lGi34bGJ9LVdDRnpyaQnjfafzOs7LwFf9nMc5Qi1COFf
	W1UJJlwuTTjNbcw2+TNm7CSqy+e532Ca2yHy5uiDVFz2Rc3BfsQD6aOj8FAepF0MkPVbCQTsi2a6a
	RVqOB+3W+8aPAL3a2mlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur4RR-0000000DTAO-3Svd;
	Wed, 27 Aug 2025 00:55:09 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur4QZ-0000000DT1j-3XEo
	for linux-i3c@lists.infradead.org;
	Wed, 27 Aug 2025 00:54:17 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3ec4802d359so16791435ab.1
        for <linux-i3c@lists.infradead.org>; Tue, 26 Aug 2025 17:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756256054; x=1756860854; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZEIQA4mupE+uey3jxAag4GNaEioXiVaRcLVR2T8bg3I=;
        b=E3LbYB/dmF+uCfnBj4MHZ+DITS1w1UwwFHaNmxe62nZXQMJBbPoRdZSjjLvkcmxp5T
         CRDDNSaHsnp0HidFY8i5ENH8gzf9FlH8a1iLvoJwVMQ+cUQySMiqTP2lGEEsn6p9sqsK
         /ntWF3+3ll668WQPJM9l98irBwD1l+CzxaiblHyQ2GFk/CBFEO06JmWLSXn6fq7o8D8S
         Kd5TSe4jJz0YyLby2CLr0fjUfR0nWL2EKMSIlWnOTsA+ZdKOtya7g7whvjgDN/iVEH++
         D9bcCnAy2ueus8IxNxYtuT8yi6C9vfCo0XylHCEDx7ARTOVBP/FFAZ0yf2XUqW+O8UrX
         vMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756256054; x=1756860854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZEIQA4mupE+uey3jxAag4GNaEioXiVaRcLVR2T8bg3I=;
        b=m8bRF2thd8NEzE66RVpuKubc9+P1qRrIYecGQjofgA9o+puxlJRXZcfqg76kQBwLDI
         wenL+xDEOy+5FanvDz8Sz6V4MBiauW5a3a6W0sTDOqY4xBqnunZpD5MkXwz4zYIE/NcE
         VnmpbtDEIy8GFsEr3qecAAlrJn1Oqw+IpW6+E1V3Xt+Y/Sf4NNdynIsLo2LLVhO7MBam
         fn+kjMaVqpCEqe2NYIt6JydlRIRGY4GwmDbW29M888GGTtobVb8aEV2TdVjAlUPDrnn+
         MOFUqmVo0rcQ6LKbPUYG8xrec9rBXZalMLUL9EbFv/ZGdiKnQeg4fGVEKKbixcEEPNNO
         U6Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVj4GR46CnGyPQNhZhMoTkODogwT7IC+SKKy096I4RjjWytXLXEnoBr2vZvpQLJ/4X+gyuPtUVlyZQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzPMGYDQOC/BxX8lcCzJb4T94xp6QIzVbg9UHWKxAY2lhYOKGaD
	vdLMDty9+AASKGrA/5xlKLajCBOP9FrEX0PvSamSl+A51t1oV3L8+yaVbgevK6TEbbW/OsYweyA
	a485J3PI5LkSFp4GRyI7HU79kzzpFKfc=
X-Gm-Gg: ASbGncvxekg++CDHYTupPS9VIM1Vk7fgHqq8O+MzFa5nU8NfumqgU8kuOJIuWena93j
	gLdFvb6prKlEXBSZsI0WG15vNB9Zo3OIwsnIrnC/J9BNZuk96Xp3nvS97JF5U1X2+fPoWwR3/4W
	IxpF/Brm4CE2FlMBW8kaCPzqpV0jujBMJ2i8fYAKFUjpMgWCjWn976F2D9lKTUEias2sbPtCF3b
	hiL0w==
X-Google-Smtp-Source: AGHT+IHMa860sVvmP76YYQV08GUqofysOvoW1SKEDan/KYfRDqnrDrIQVLrmma7U62qXIljn4z3FZRh57lr8FaNRmmA=
X-Received: by 2002:a05:6e02:1a62:b0:3ec:2c8a:f34 with SMTP id
 e9e14a558f8ab-3ec2c8a1665mr135187095ab.17.1756256054394; Tue, 26 Aug 2025
 17:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250819090831.3009647-1-yschu@nuvoton.com> <aK3eHkf31uIw04EH@lizhi-Precision-Tower-5810>
In-Reply-To: <aK3eHkf31uIw04EH@lizhi-Precision-Tower-5810>
From: Stanley Chu <stanley.chuys@gmail.com>
Date: Wed, 27 Aug 2025 08:54:03 +0800
X-Gm-Features: Ac12FXzme2BffR6ENnicTn8cdJJfQlkMXwuqX08H-q-6u-JN8e4csUHUF6z_dcU
Message-ID: <CAPwEoQPnxW2jRpcqE_QSW2rNm8-zHfkTF=Ns_w7szYj-k3bTXA@mail.gmail.com>
Subject: Re: [PATCH v1] i3c: master: svc: Use manual response for IBI events
To: Frank Li <Frank.li@nxp.com>
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_175415_884482_7E636312 
X-CRM114-Status: GOOD (  28.85  )
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

T24gV2VkLCBBdWcgMjcsIDIwMjUgYXQgMTI6MTfigK9BTSBGcmFuayBMaSA8RnJhbmsubGlAbnhw
LmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIEF1ZyAxOSwgMjAyNSBhdCAwNTowODozMVBNICswODAw
LCBTdGFubGV5IENodSB3cm90ZToKPiA+IEZyb206IFN0YW5sZXkgQ2h1IDx5c2NodUBudXZvdG9u
LmNvbT4KPiA+Cj4gPiBVc2luZyBJQklSRVNQX0FVVE8gY2F1c2VzIHRoZSBoYXJkd2FyZSB0byBB
Q0sgSUJJIHJlcXVlc3RzIGV2ZW4gd2hlbiB0aGUKPiA+IHRhcmdldCBpcyBub3QgaW4gdGhlIGRl
dmljZSBsaXN0LiBUaGUgc3ZjX2kzY19tYXN0ZXJfbmFja19pYmkoKSBoYXMgbm8KPiA+IGVmZmVj
dCBpbiBzdWNoIGNhc2UuCj4KPiBob3cgdGhpcyBjYXNlIGNhbiBoYXBwZW4gc2luY2UgZGVmYXVs
dCB0YXJnZXQncyBJQkkgaXMgZGlzYWJsZWQuIE5lZWQgaG9zdAo+IHNlbmQgSUJJIGVuYWJsZSBj
b21tYW5kIHRvIHRhcmdldCBkZXZpY2VzIGJlZm9yZSB0YXJnZXQgcHVsbCBTREEgbG93ZXIuCj4K
SGkgRnJhbmssCgpUaGlzIGlzIHRvIGV4cGxhaW4gdGhhdCB0aGUgb3JpZ2luYWwgY29kZSBzdmNf
aTNjX21hc3Rlcl9uYWNrX2liaSgpCndpbGwgbmV2ZXIgdGFrZSBlZmZlY3Qgd2hlbiB1c2luZwpB
VVRPSUJJIHdpdGggSUJJUkVTUF9BVVRPIHJ1bGUuCiAgICAgICAgLyogSGFuZGxlIHRoZSBjcml0
aWNhbCByZXNwb25zZXMgdG8gSUJJJ3MgKi8KICAgICAgICBzd2l0Y2ggKGliaXR5cGUpIHsKICAg
ICAgICBjYXNlIFNWQ19JM0NfTVNUQVRVU19JQklUWVBFX0lCSToKICAgICAgICAgICAgICAgIGRl
diA9IHN2Y19pM2NfbWFzdGVyX2Rldl9mcm9tX2FkZHIobWFzdGVyLCBpYmlhZGRyKTsKICAgICAg
ICAgICAgICAgIGlmICghZGV2IHx8ICFpc19ldmVudHNfZW5hYmxlZChtYXN0ZXIsIFNWQ19JM0Nf
RVZFTlRfSUJJKSkgewogICAgICAgICAgICAgICAgICAgICAgICBzdmNfaTNjX21hc3Rlcl9uYWNr
X2liaShtYXN0ZXIpOwogICAgICAgICAgICAgICAgfQoKPiA+Cj4gPiBBdXRvSUJJIGhhcyBhbm90
aGVyIGlzc3VlIHRoYXQgdGhlIGNvbnRyb2xsZXIgZG9lc24ndCBxdWl0IEF1dG9JQkkgc3RhdGUK
PiA+IGFmdGVyIGFuIElCSVdPTiBwb2xsaW5nIHRpbWVvdXQuIFRoZSBmb2xsb3dpbmcgc2VxdWVu
Y2UgaXMgdGhlIGNhc2U6Cj4gPiAxLiBUYXJnZXQgcHVsbHMgU0RBIGxvdwo+ID4gMi4gU0xWU1RB
UlQgaW50ZXJydXB0IHRyaWdnZXJzIHRoZSBJQkkgSVNSCj4gPiAzLiBUYXJnZXQgcmVsZWFzZXMg
U0RBCj4gPiA0LiBEcml2ZXIgd3JpdGVzIEF1dG9JQkkgcmVxdWVzdCB0byBNQ1RSTAo+ID4gNS4g
U0RBIGlzIGhpZ2gsIHNvIEF1dG9JQkkgcHJvY2VzcyBkb2VzIG5vdCBzdGFydAo+ID4gNi4gSUJJ
V09OIHBvbGxpbmcgdGltZXMgb3V0Cj4gPiA3LiBDb250cm9sbGVyIHN0YXRlIGlzIEF1dG9JQkkg
YW5kIGRvZXNuJ3QgYWNjZXB0IEVtaXRTdG9wIHJlcXVlc3QKPiA+Cj4gPiBFbWl0dGluZyBicm9h
ZGNhc3QgYWRkcmVzcyB3aXRoIElCSVJFU1BfTUFOVUFMIGF2b2lkcyBib3RoIGlzc3Vlcy4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTdGFubGV5IENodSA8eXNjaHVAbnV2b3Rvbi5jb20+Cj4gPiAt
LS0KPiA+ICBkcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyB8IDE2ICsrKysrKysr
KysrLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFz
dGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+ID4gaW5kZXggNzAx
YWUxNjViMjViLi4xNzY0NGUwNDFiNDQgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0
ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+ID4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2Mt
bWFzdGVyLmMKPiA+IEBAIC01MTcsOSArNTE3LDEwIEBAIHN0YXRpYyB2b2lkIHN2Y19pM2NfbWFz
dGVyX2liaV9pc3Ioc3RydWN0IHN2Y19pM2NfbWFzdGVyICptYXN0ZXIpCj4gPiAgICAgICAgKi8K
PiA+ICAgICAgIHdyaXRlbChTVkNfSTNDX01JTlRfSUJJV09OLCBtYXN0ZXItPnJlZ3MgKyBTVkNf
STNDX01TVEFUVVMpOwo+ID4KPiA+IC0gICAgIC8qIEFja25vd2xlZGdlIHRoZSBpbmNvbWluZyBp
bnRlcnJ1cHQgd2l0aCB0aGUgQVVUT0lCSSBtZWNoYW5pc20gKi8KPiA+IC0gICAgIHdyaXRlbChT
VkNfSTNDX01DVFJMX1JFUVVFU1RfQVVUT19JQkkgfAo+ID4gLSAgICAgICAgICAgIFNWQ19JM0Nf
TUNUUkxfSUJJUkVTUF9BVVRPLAo+ID4gKyAgICAgLyogRW1pdCBicm9hZGNhc3QgYWRkcmVzcyBm
b3IgYXJiaXRyYXRpb24gKi8KPgo+IE5lZWQgY29tbWVudHMgaGVyZSB3aHkgUmVxdWVzdF9BdXRv
SUJJIG5vdCB3b3JrLiBJIHRoaW5rIGl0IGlzIElQIGRlc2lnbgo+IGRlZmVjdCB0byBtYWtlIFJF
UVVFU1RfQVVUT19JQkkgdXNlbGVzcy4KSXQgaXMgbm90IGFuIElQIGRlZmVjdC4gUGVyIHNwZWMs
IEF1dG9JQkkgZW1pdHMgYSBTVEFSVCB3aXRoIGFkZHJlc3MKNydoN0Ugd2hlbiBhIHNsYXZlIHB1
bGxzIFNEQSBsb3cuCkEgU0RBIGdsaXRjaCAoaGlnaC0+bG93LT5oaWdoKSBjYW4gY2F1c2UgdGhl
IGNvbnRyb2xsZXIgdG8gcmVtYWluIGluCkF1dG9JQkkgc3RhdGUuCjEuIFNEQSBoaWdoLT5sb3c6
IHRyaWdnZXIgSUJJIGlzciB0byBleGVjdXRlCjIuIFNEQSBsb3ctPmhpZ2gKMy4gSUJJIGlzciB3
cml0ZXMgYW4gQXV0b0lCSSByZXF1ZXN0LCB0aGUgY29udHJvbGxlciB3aWxsIG5vdCBlbWl0IGEK
U1RBUlQgYmVjYXVzZSBTREEgaXMgbm90IGxvdy4KNC4gRmluYWxseSBJQklXT04gcG9sbGluZyB0
aW1lcyBvdXQsIHRoZSBjb250cm9sbGVyIHJlbWFpbnMgaW4gQXV0b0lCSSBzdGF0ZS4KCj4KPiBP
bmx5IGNvbmNlcm4gaGVyZSBpcyB0aGF0IHN2Y19pM2NfbWFzdGVyX2Fja19pYmkoKSBuZWVkIHNl
bmQgaW4gMTAwdXMgYnkKPiBpM2Mgc3BlYyByZXF1aXJlbWVudC4KVGhlIGZ1bmN0aW9uIHN2Y19p
M2NfbWFzdGVyX2Fja19pYmkoKSBleGVjdXRlcyBwcm9tcHRseSBpbiB0aGUgSVJRCmhhbmRsZXIs
IHRha2luZyBtdWNoIGxlc3MgdGhhbiAxMDDigK91cy4KCi0tLQpUaGFua3MuClN0YW5sZXkKPgo+
IEZyYW5rCj4KPiA+ICsgICAgIHdyaXRlbChTVkNfSTNDX01DVFJMX1JFUVVFU1RfU1RBUlRfQURE
UiB8Cj4gPiArICAgICAgICAgICAgU1ZDX0kzQ19NQ1RSTF9JQklSRVNQX01BTlVBTCB8Cj4gPiAr
ICAgICAgICAgICAgU1ZDX0kzQ19NQ1RSTF9BRERSKEkzQ19CUk9BRENBU1RfQUREUiksCj4gPiAg
ICAgICAgICAgICAgbWFzdGVyLT5yZWdzICsgU1ZDX0kzQ19NQ1RSTCk7Cj4gPgo+ID4gICAgICAg
LyogV2FpdCBmb3IgSUJJV09OLCBzaG91bGQgdGFrZSBhcHByb3hpbWF0ZWx5IDEwMHVzICovCj4g
PiBAQCAtNTM5LDEwICs1NDAsMTUgQEAgc3RhdGljIHZvaWQgc3ZjX2kzY19tYXN0ZXJfaWJpX2lz
cihzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3RlcikKPiA+ICAgICAgIHN3aXRjaCAoaWJpdHlw
ZSkgewo+ID4gICAgICAgY2FzZSBTVkNfSTNDX01TVEFUVVNfSUJJVFlQRV9JQkk6Cj4gPiAgICAg
ICAgICAgICAgIGRldiA9IHN2Y19pM2NfbWFzdGVyX2Rldl9mcm9tX2FkZHIobWFzdGVyLCBpYmlh
ZGRyKTsKPiA+IC0gICAgICAgICAgICAgaWYgKCFkZXYgfHwgIWlzX2V2ZW50c19lbmFibGVkKG1h
c3RlciwgU1ZDX0kzQ19FVkVOVF9JQkkpKQo+ID4gKyAgICAgICAgICAgICBpZiAoIWRldiB8fCAh
aXNfZXZlbnRzX2VuYWJsZWQobWFzdGVyLCBTVkNfSTNDX0VWRU5UX0lCSSkpIHsKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICBzdmNfaTNjX21hc3Rlcl9uYWNrX2liaShtYXN0ZXIpOwo+ID4gLSAg
ICAgICAgICAgICBlbHNlCj4gPiArICAgICAgICAgICAgIH0gZWxzZSB7Cj4gPiArICAgICAgICAg
ICAgICAgICAgICAgaWYgKGRldi0+aW5mby5iY3IgJiBJM0NfQkNSX0lCSV9QQVlMT0FEKQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3ZjX2kzY19tYXN0ZXJfYWNrX2liaShtYXN0
ZXIsIHRydWUpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGVsc2UKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN2Y19pM2NfbWFzdGVyX2Fja19pYmkobWFzdGVyLCBmYWxzZSk7
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgc3ZjX2kzY19tYXN0ZXJfaGFuZGxlX2liaShtYXN0
ZXIsIGRldik7Cj4gPiArICAgICAgICAgICAgIH0KPiA+ICAgICAgICAgICAgICAgYnJlYWs7Cj4g
PiAgICAgICBjYXNlIFNWQ19JM0NfTVNUQVRVU19JQklUWVBFX0hPVF9KT0lOOgo+ID4gICAgICAg
ICAgICAgICBpZiAoaXNfZXZlbnRzX2VuYWJsZWQobWFzdGVyLCBTVkNfSTNDX0VWRU5UX0hPVEpP
SU4pKQo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0Cmxp
bnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
