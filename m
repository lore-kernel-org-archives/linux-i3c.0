Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D548BC87FCE
	for <linux-i3c@archiver.kernel.org>; Fri, 25 Jul 2025 14:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s2Bo5SIbRdH0alJZFnNyZelOR+GIUK9+xglHys3w1mw=; b=Q8/QSOypmGlT4C
	40kq2qSKQKW/XP8KN095WbNWUcEnHuTW07K9ivasCBwYh+bSCMgeCw4zWtIHaH0gOGq6rIazw7bF9
	TfgOQVJfOEIOVoAYtOXqmnPzae3lz5darI2yL0bFq2RyKK5Ts0JjjpZpqgdlHRWFR1yo/SMjC2NmE
	P5k51U+TP4pE/TtXHb4lFt8OHQ/2XuZ8frSrZuTtYg3StrR/n9RiT0OnbXS8xxZTfEHMdXBj0kyyz
	fhZARNHRPUWqKCw7/jQpieChO/kKb8rmhjSBg7z3hyqaFzz1/5ih8iHAR5UoxkMK3bH8H8xlbkMlM
	esQcsa+rQBYA6sZdC6nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJl4-0000000A2cD-2eUe;
	Fri, 25 Jul 2025 14:50:50 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJl1-0000000A2bs-2IEL
	for linux-i3c@lists.infradead.org;
	Fri, 25 Jul 2025 14:50:48 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3e28be470f1so10156055ab.0
        for <linux-i3c@lists.infradead.org>; Fri, 25 Jul 2025 07:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753455046; x=1754059846; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2PbIGc+a/gZTMMKJtr8RstRfsm9zqsG3+vNqjqL52Y=;
        b=TRl1SOUzd/8KuSwmJvymzGq+2yBhSXDmjGvdHEwMimONOFSyiQ9rQJhj3nizR5NNL5
         +EwHp974sLk0qd0oWE5TFpYW/5eC3GO+VfYlb4mlCoHChQs4UTV+o0C9ZvZYZnsewucT
         098Avs8TUAq/JbkkdtebCUNpUrZifT1Pj2Nw9HGQ6yrOmLKOp9HrC+2JjFZMGVX4ARDz
         5kXPNlXFeGJ/YrfCTmVT3ddDcDkyCbiom7MWjJbhqqH9y11A5fnO8M9FqCxcUhDxtRWa
         z9wciAbkVRMVsx4Hmse+3AxKje/93S/cp22E8romiuXKdPRoX9MToftypDHcin1th88L
         OOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753455046; x=1754059846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2PbIGc+a/gZTMMKJtr8RstRfsm9zqsG3+vNqjqL52Y=;
        b=RzeEKjDUBb8oGOrwnLM1OhQKYpDAKRo0yM71lb8Hiq5lsVaK4mIYbVxRQi011SA3Ou
         zg2rNvRAvy3ZhbA//8PExYHFXrKYOe9/PMOodlnEUGTCfgkEuHPtG8TbINSzE2K0xiXK
         I1zDZm3UfEjqr2gJ2+giU2ucBCOcvwpY+ZQSgGhZo0lIj19Lepop1F1gMYgvh+Ek5wxX
         KFFt3DTZPZwWnAordUYv5fkHSN1/0+zD3zdV/IONOYv1giobvNnvnKO8J83Z5nJ8NLnk
         jeIVBOuAcmPH4LIeR7efnIdtEEud8lRxobA0L5oe4f1d4KVXgChv58hnpuV+UFH692BU
         h12w==
X-Forwarded-Encrypted: i=1; AJvYcCXjDgMbUUQqRHNf/ecXVPgJBH0WEdPA/MEM3f/6bhyJOCfgz7yqyRLL0JUGicpAXfc1SOwXzaL1fko=@lists.infradead.org
X-Gm-Message-State: AOJu0YzpVMyZZdWnGqlRoqsUNsVHMOHmT2IYUfaaXeuwA0uv07O5+lAi
	dukfUgEX9y4kRr0NdTduhC5sUhX7xD4PLhVAeIuSg91NtFG6NdbaglY//wjqoX3rxi777Tmnztw
	X5Ayl/quCZ7UxyEtN5XBtKxVC1JhQDxXtqRkn
X-Gm-Gg: ASbGncvcvuF5gaigk+plZMZFTW+HC1YG0Wd9nIbc8ePkb0Rit9rA+3F7aUq4g3nKvr4
	5ArIu8BnMnbJBJYDHQYhFa8ZqTXkoSs9qM2sugTIPqNXn8lfq7XES3/QNzQzh1HsH2f2kckI8iT
	kMZCfEK4iyKC4dxqgAtRlX2Y9G2i2uw3bwE+R8UyZyuIagJhGWvQeb3Qv6Tae/6GxBXdqKvWLpw
	rv6MuyMY2UEBUziD69FWEk5m6BcNz0q63hxMb70OA==
X-Google-Smtp-Source: AGHT+IFRzmYs6EmiZkuesiMAP3zE+2KV9b7NZ3L3i3a7m6FIAIMbSg+NeigJM4/DilwBYPj/ty6HSP8kU7onrYpm8bg=
X-Received: by 2002:a92:cdaa:0:b0:3e2:77d9:f8fc with SMTP id
 e9e14a558f8ab-3e3c46dd0a4mr35574835ab.10.1753455046337; Fri, 25 Jul 2025
 07:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250725070310.1655585-1-yschu@nuvoton.com> <aIOKeClm/vOPp4IU@lizhi-Precision-Tower-5810>
In-Reply-To: <aIOKeClm/vOPp4IU@lizhi-Precision-Tower-5810>
From: Stanley Chu <stanley.chuys@gmail.com>
Date: Fri, 25 Jul 2025 22:50:34 +0800
X-Gm-Features: Ac12FXx4WsSVfWalX7mN2__A0yXzNtFP8iAww6WieAg6rByE_Jzl78D7P32UgS0
Message-ID: <CAPwEoQNfdit9fOiUY-WzQvS377nEqBu=s8S1zqS7tdSZfQeCHQ@mail.gmail.com>
Subject: Re: [PATCH v1] i3c: master: svc: Fix npcm845 FIFO_EMPTY quirk
To: Frank Li <Frank.li@nxp.com>
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_075047_589884_F01A2221 
X-CRM114-Status: GOOD (  25.54  )
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

SGkgRnJhbmssCgpPbiBGcmksIEp1bCAyNSwgMjAyNSBhdCA5OjQ14oCvUE0gRnJhbmsgTGkgPEZy
YW5rLmxpQG54cC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdWwgMjUsIDIwMjUgYXQgMDM6MDM6
MTBQTSArMDgwMCwgU3RhbmxleSBDaHUgd3JvdGU6Cj4gPiBGcm9tOiBTdGFubGV5IENodSA8eXNj
aHVAbnV2b3Rvbi5jb20+Cj4gPgo+ID4gUHJlZmlsbGluZyBpbiBwcml2YXRlIHdyaXRlIHRyYW5z
ZmVycyBpcyBvbmx5IG5lY2Vzc2FyeSB3aGVuIHRoZSBGSUZPCj4gPiBpcyBlbXB0eS4gT3RoZXJ3
aXNlLCBpZiB0aGUgdHJhbnNmZXIgaXMgTkFDS2VkIGR1ZSB0byBJQklXT04gYW5kIHJldHJpZXMK
PiA+IGNvbnRpbnVlLCBkYXRhIG1heSBiZSBwcmVmaWxsZWQgYWdhaW4gYnV0IGNvdWxkIGJlIGxv
c3QgYmVjYXVzZSB0aGUgRklGTwo+ID4gaXMgbm90IGVtcHR5Lgo+Cj4gd2h5ICJtYXliZSBwcmVm
aWxsZWQiLCBwbGVhc2UgdXNlIGNlcnRhaW4gd29yZHMuClRoZSBvcmlnaW5hbCBjb2RlIGRpZG4n
dCBjb25zaWRlciB0aGUgcmV0cnkgY2FzZSwgZGF0YSBsb3N0IGhhcHBlbiBpbgp0aGUgcmV0cnkg
Y2FzZSBvbmx5IHdoZW4gdG90YWwgd3JpdGUgYnl0ZXMgaXMgbGFyZ2VyIHRoYW4gRklGTyBzaXpl
LApub3QgYWx3YXlzIGhhcHBlbi4KSW4gdGhlIGV4YW1wbGUgb2Ygd3JpdGluZyAxNyBieXRlcyAo
RklGTyBzaXplIGlzIDE2KSwgdGhlIGxhc3QgYnl0ZSBpcyBsb3N0LgoxLiBFbWl0IFMrQWRkci9X
CjIuIFdyaXRlIDE2IGJ5dGVzIHRvIEZJRk8gKEZJRk8gaXMgZnVsbCkKMy4gTkFDS2VkIGR1ZSB0
byBJQklXT04KNC4gKHJldHJ5KSBFbWl0IFNyK0FkZHIvVwo1LiBXcml0ZSBsYXN0IGJ5dGUgdG8g
RklGTyAoZGF0YSBsb3N0KQoKSSBqdXN0IG5lZWQgdG8gcHJlZmlsbCBGSUZPIGluIHRoZSBiZWdp
bm5pbmcgdG8gbWFrZSBzdXJlIEZJRk8gaXMgbm90CmVtcHR5IHdoZW4gSFcgc3RhcnRzIHRyYW5z
bWl0dGluZy4KU28sIHRoaXMgcGF0Y2ggYWRkcyBhIGNvbmRpdGlvbiB0aGF0IHByZWZpbGwgRklG
TyBvbmx5IHdoZW4gRklGTyBpcyBlbXB0eS4KCj4KPiA+Cj4gPiBGaXhlczogNDAwOGE3NGUwZjli
ICgiaTNjOiBtYXN0ZXI6IHN2YzogRml4IG5wY204NDUgRklGTyBlbXB0eSBpc3N1ZSIpCj4gPiBT
aWduZWQtb2ZmLWJ5OiBTdGFubGV5IENodSA8eXNjaHVAbnV2b3Rvbi5jb20+Cj4gPiAtLS0KPiA+
ICBkcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyB8IDExICsrKysrKysrKystCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgYi9kcml2
ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+ID4gaW5kZXggN2UxYTdjYjk0YjQzLi4z
NGI2ZTEyNWIxOGEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1t
YXN0ZXIuYwo+ID4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiA+
IEBAIC0xMDQsNiArMTA0LDcgQEAKPiA+ICAjZGVmaW5lICAgU1ZDX0kzQ19NREFUQUNUUkxfVFhU
UklHX0ZJRk9fTk9UX0ZVTEwgR0VOTUFTSyg1LCA0KQo+ID4gICNkZWZpbmUgICBTVkNfSTNDX01E
QVRBQ1RSTF9SWFRSSUdfRklGT19OT1RfRU1QVFkgMAo+ID4gICNkZWZpbmUgICBTVkNfSTNDX01E
QVRBQ1RSTF9SWENPVU5UKHgpIEZJRUxEX0dFVChHRU5NQVNLKDI4LCAyNCksICh4KSkKPiA+ICsj
ZGVmaW5lICAgU1ZDX0kzQ19NREFUQUNUUkxfVFhDT1VOVCh4KSBGSUVMRF9HRVQoR0VOTUFTSygy
MCwgMTYpLCAoeCkpCj4gPiAgI2RlZmluZSAgIFNWQ19JM0NfTURBVEFDVFJMX1RYRlVMTCBCSVQo
MzApCj4gPiAgI2RlZmluZSAgIFNWQ19JM0NfTURBVEFDVFJMX1JYRU1QVFkgQklUKDMxKQo+ID4K
PiA+IEBAIC0yODAsNiArMjgxLDEzIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBpc19ldmVudHNfZW5h
YmxlZChzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3RlciwgdTMyIG1hc2spCj4gPiAgICAgICBy
ZXR1cm4gISEobWFzdGVyLT5lbmFibGVkX2V2ZW50cyAmIG1hc2spOwo+ID4gIH0KPiA+Cj4gPiAr
c3RhdGljIGlubGluZSBib29sIHN2Y19pM2NfbWFzdGVyX3R4X2VtcHR5KHN0cnVjdCBzdmNfaTNj
X21hc3RlciAqbWFzdGVyKQo+ID4gK3sKPiA+ICsgICAgIHUzMiByZWcgPSByZWFkbChtYXN0ZXIt
PnJlZ3MgKyBTVkNfSTNDX01EQVRBQ1RSTCk7Cj4gPiArCj4gPiArICAgICByZXR1cm4gKFNWQ19J
M0NfTURBVEFDVFJMX1RYQ09VTlQocmVnKSA9PSAwKTsKPiA+ICt9Cj4gPiArCj4gPiAgc3RhdGlj
IGJvb2wgc3ZjX2kzY19tYXN0ZXJfZXJyb3Ioc3RydWN0IHN2Y19pM2NfbWFzdGVyICptYXN0ZXIp
Cj4gPiAgewo+ID4gICAgICAgdTMyIG1zdGF0dXMsIG1lcnJ3YXJuOwo+ID4gQEAgLTEzMDMsNyAr
MTMxMSw4IEBAIHN0YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJfeGZlcihzdHJ1Y3Qgc3ZjX2kzY19t
YXN0ZXIgKm1hc3RlciwKPiA+ICAgICAgICAgICAgICAgICogVGhlIG9ubHkgd2F5IHRvIHdvcmsg
YXJvdW5kIHRoaXMgaGFyZHdhcmUgaXNzdWUgaXMgdG8gbGV0IHRoZQo+ID4gICAgICAgICAgICAg
ICAgKiBGSUZPIHN0YXJ0IGZpbGxpbmcgYXMgc29vbiBhcyBwb3NzaWJsZSBhZnRlciBFbWl0U3Rh
cnRBZGRyLgo+ID4gICAgICAgICAgICAgICAgKi8KPiA+IC0gICAgICAgICAgICAgaWYgKHN2Y19o
YXNfcXVpcmsobWFzdGVyLCBTVkNfSTNDX1FVSVJLX0ZJRk9fRU1QVFkpICYmICFybncgJiYgeGZl
cl9sZW4pIHsKPiA+ICsgICAgICAgICAgICAgaWYgKHN2Y19oYXNfcXVpcmsobWFzdGVyLCBTVkNf
STNDX1FVSVJLX0ZJRk9fRU1QVFkpICYmICFybncgJiYgeGZlcl9sZW4gJiYKPiA+ICsgICAgICAg
ICAgICAgICAgIHN2Y19pM2NfbWFzdGVyX3R4X2VtcHR5KG1hc3RlcikpIHsKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICB1MzIgZW5kID0geGZlcl9sZW4gPiBTVkNfSTNDX0ZJRk9fU0laRSA/IDAg
OiBTVkNfSTNDX01XREFUQUJfRU5EOwo+ID4gICAgICAgICAgICAgICAgICAgICAgIHUzMiBsZW4g
PSBtaW5fdCh1MzIsIHhmZXJfbGVuLCBTVkNfSTNDX0ZJRk9fU0laRSk7Cj4KPiBpZiBwcmVmaWxs
IHRvIEZJRk8gU0laRSBlYWNoIHRpbWUsIHN1Y2ggYXMKPgo+IHJlcGxhY2UgU1ZDX0kzQ19GSUZP
X1NJWkUgd2l0aAo+Cj4gU1ZDX0kzQ19GSUZPX1NJWkUgLSBTVkNfSTNDX01EQVRBQ1RSTF9UWENP
VU5UKHJlYWRsKG1hc3Rlci0+cmVncyArIFNWQ19JM0NfTURBVEFDVFJMKSkuCj4KVGhlIGZyZWUg
c3BhY2UgaXMgU1ZDX0kzQ19GSUZPX1NJWkUgd2hlbiBGSUZPIGlzIGVtcHR5LCBubyBuZWVkIHRv
CmNoZWNrIFRYIGNvdW50IGFnYWluLgoKLS0KU3RhbmxleQoKPiBGcmFuawo+ID4KPiA+IC0tCj4g
PiAyLjM0LjEKPiA+CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWkzYwo=
