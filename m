Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B06E93805
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Apr 2026 04:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Ue0FHGyTHgTF/GU2SQjmSE5q274QeigQm54LYiiHCY=; b=cnd8Sb+ZdMs8u+
	Ja+nCG7wYoqvRB9TfHFonH0VXOPN3Rfe4b8anbXXC9t5yHkXmDnn7dYR/aVSg0s42A5DYO23n/pP0
	eYOvvvA7lheBVKMt21jhnOxt/wad2t4BOTbbiz0IruZ6nx3UWp8obOALgJkHZtHy3T3vEWSK/H0pa
	NjSzY4l8KMlW+R9YPe1ujsqDE9gxuksYZxG8q4omm1ecLuxWl0RoMCM3CwTvCwDo+BcKXDto4ErfY
	vmfQZtCnuDkt10/LOBSetRU3KoHHUUJDkQPqWqn87moTYPuBBNrJ6XqW+4vrRUI1IQcKuREYfklRH
	Y44jKU3qVQezByx9fASw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC8TB-0000000ExU2-2Ta1;
	Mon, 13 Apr 2026 04:00:17 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC8T7-0000000ExTh-1nXu
	for linux-i3c@lists.infradead.org;
	Mon, 13 Apr 2026 04:00:16 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7dbce74e537so3087629a34.1
        for <linux-i3c@lists.infradead.org>; Sun, 12 Apr 2026 21:00:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776052812; cv=none;
        d=google.com; s=arc-20240605;
        b=PhN0pXFatVxHFU4xTXLwAYKAA4iz71b0W+b6IVFgt8vO21D+XNts2D1uIYjLeqelZ1
         lRSk35RhhiDJgLCR7MTLeoRD2ONJ3sIzsZT9rwyyC266N/YyROunJppRPmRO8Cf9tUj9
         nmRaPorKxpWCZIS54c/Y3EI74kUfnzNKLH5aGhwMrjlKEc9UnggEsQlfF/oCylyEfBx1
         NAnRQBlnW6SwGjXOsVk7ybrdQrKBnNKDv1JvCUEwagtiBbGZxPY9aAe5z/ZUUVL593PM
         jGyTES66R9VQkxp+ms07vBolYbDwWLvzGE0m509AKxZMo6cHrhOrmYMl+XHPoQUlyZDf
         m0gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e1qugk97HN58oG4lfsb4e7f1SbUWIQKeDLHXzdZcL9U=;
        fh=3BLx9VVUacZDFfivu87J+JSsImbfEs+xwh/Z2zG2RhQ=;
        b=etWmLASV2I7WjxyP8eOmvlfaKqIuwRNYAtymBaCZZuv0824LRSUytvuSelyG9cLwnZ
         ZEQykGk0qmdSyEE7tMmLy94nxgQRTC76ZnIRw8SE5T7OKZVOvpGkJ0WwcBsiH1o/qWwy
         Mvv9gK3vZ0AMxYIg5rWwhOeih00rXCnbazgclSjdXUAEUniwXQPrOVN7tx7rjsAEKvG4
         eXJPncqTr72J6gpfGK0btmJaj+i5xr7TRCKz6CxPkBpwV7ber/msgyCuf3ok3pWB3LoI
         +HrGf6IjP/Uwk4b6+xuUm4JizvjB2nAwI3nGRsJIhTFUCvZzVNZCBTYNNMc6s7bSWJiM
         fGtg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776052812; x=1776657612; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1qugk97HN58oG4lfsb4e7f1SbUWIQKeDLHXzdZcL9U=;
        b=oRwq11LoPUbwWQd5bGwd5mqlvrD3xi4pvBw31VluNGel6HjcznotpxDN7bbFtFrg5u
         3uIoqIdPE7/5HUhcCZMeJn2bhJtn9yrLxo6xUo1iCtdPkJl5p3Wo023pO5PM/ktqaTas
         gvlJNzN4o6NC0f3GhZmsRVkk9Fxi6gBeHPnGhsM15jWCfbc+gI2ojM/CqqinLbjfcVoG
         +dWkQZanxEYqpwBi8v/kmI9ZZpoXq3ArMmNv1uzwdrYWzth3iMzw1xeI74ZzYKJinjng
         Wml8/ZHBb4ROH0q9DYbZhoyOZNOWTJYd4Te+yTHfE0Wlrj8LIPzaW0UmjOQrN2lUzX+s
         7SSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776052812; x=1776657612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e1qugk97HN58oG4lfsb4e7f1SbUWIQKeDLHXzdZcL9U=;
        b=R+DK5lRI6DiIiKgL0Yk00yWoXaClNadUISqyw55QGkcVd7NmlH6vK29tqhcObUv+wK
         Anj8xHN2f3vEK8uQgxk7BCj0Jxl5+FfuIpR5luMFW7Xuqcaq9jXUp7Pdc/ynED1ScVN3
         LOUBxwNN9AJGXmr5az+tZh/xyZDCWg4qWB15AnqCy/CNTD/FMCYKo5e6ntpXFCtVm6Zi
         gVjm/dxC7PyCKW0viX1q7ki6vYu/Iza4hUYcD2jga7Waean076I+RTFdb36iUGD9tOom
         rI9MBq8rCwwi0A8JOxuwpv5KmueCDDjKIAci+60sL9CrYVTk39G8Pb3NBXLuNYiZ2MdZ
         4yew==
X-Forwarded-Encrypted: i=1; AJvYcCU0KjMu9HhkZ9O0vh7ght/QKJjvj39de1kPwhhUVdBjtSvmhvu6wfYNP8uu7ubyY7T//i9jofpDyvA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyOSDDJ+njnH5rHoiIWNtqI4DKl/PJg5g8j/aKNc8cPEJFlvsim
	kEnOzQD3J7Ur2RXA3hfM7dupYLpnLLeYhKoVCUVVWgjB9mEKJCqm1ufdspmI1GglqZQIn4m8oxV
	0MS17mHArEMY3v7tIY7Eo0ya8z7v1tac=
X-Gm-Gg: AeBDievdzlU6z5eEVTpGxfgSSw/COBKcOd7BA5L5gVxEEYJ/VlQFDmg5MaPnvFuAQvO
	EVwe6XDk+QHmTCK1mmnBJHhujifBiigDSJ+S7OR6kIgTK9kPBPdK6h702vQOZ+XiAJN87aQjNQB
	I6cMzQ5kuYnmwCUxVsNrAvUAr/Z33ennUEXU3DwIkFiLV4R+0GJR1kvVWCh8znmmRPCdgmxA2qD
	IacK3ETX1s2E8KZkunCfk7i42zxtrUZgGWAjOVTdl/zUrc8fLHh8YiqZobBsaNgTuRIcxHmSsyS
	vobTGOs=
X-Received: by 2002:a05:6820:1349:b0:68e:514d:1d60 with SMTP id
 006d021491bc7-68e514d2791mr2873148eaf.45.1776052811666; Sun, 12 Apr 2026
 21:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260413005040.1211107-1-yschu@nuvoton.com> <20260413005040.1211107-2-yschu@nuvoton.com>
 <adxD10wsP7hJdR9y@lizhi-Precision-Tower-5810> <CAPwEoQPsp6mEqHaztnjKvh9qd49H7jKbq0EGBBR_fa70e-iR=g@mail.gmail.com>
 <adxcMiW7HWr4KutC@lizhi-Precision-Tower-5810>
In-Reply-To: <adxcMiW7HWr4KutC@lizhi-Precision-Tower-5810>
From: Stanley Chu <stanley.chuys@gmail.com>
Date: Mon, 13 Apr 2026 11:59:59 +0800
X-Gm-Features: AQROBzA8_eErRQXdIfTVB0gy3KVIVTeZtLAMsHjVy9WRgRSj38p_4so1fPzpw4Y
Message-ID: <CAPwEoQNy7yMhfP-7rZevenwnasy2u_=nm0f4hReAbUbCc4-J1g@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] i3c: master: svc: Fix missed IBI after false
 SLVSTART on NPCM845
To: Frank Li <Frank.li@nxp.com>
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_210014_465016_F1CEEACE 
X-CRM114-Status: GOOD (  32.80  )
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

T24gTW9uLCBBcHIgMTMsIDIwMjYgYXQgMTE6MDDigK9BTSBGcmFuayBMaSA8RnJhbmsubGlAbnhw
LmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEFwciAxMywgMjAyNiBhdCAwOTo0MDowMkFNICswODAw
LCBTdGFubGV5IENodSB3cm90ZToKPiA+IE9uIE1vbiwgQXByIDEzLCAyMDI2IGF0IDk6MTbigK9B
TSBGcmFuayBMaSA8RnJhbmsubGlAbnhwLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIE1vbiwg
QXByIDEzLCAyMDI2IGF0IDA4OjUwOjM5QU0gKzA4MDAsIFN0YW5sZXkgQ2h1IHdyb3RlOgo+ID4g
PiA+IEZyb206IFN0YW5sZXkgQ2h1IDx5c2NodUBudXZvdG9uLmNvbT4KPiA+ID4gPgo+ID4gPiA+
IFRoZSBOUENNODQ1IEkzQyBjb250cm9sbGVyIG1heSByYWlzZSBhIGZhbHNlIFNMVlNUQVJUIGlu
dGVycnVwdC4gVGhlCj4gPiA+ID4gaGFuZGxlciBmaXJzdCBsYXRjaGVzIE1TVEFUVVMgYW5kIHRo
ZW4gY2xlYXJzIFNMVlNUQVJULiBJZiBhIHJlYWwgSUJJCj4gPiA+ID4gcmVxdWVzdCBhcnJpdmVz
IGFmdGVyIHRoZSBoYW5kbGVyIGxhdGNoZXMgTVNUQVRVUyBidXQgYmVmb3JlIGl0IGNsZWFycwo+
ID4gPiA+IHRoZSBTTFZTVEFSVCBpbnRlcnJ1cHQgc3RhdHVzLAo+ID4gPgo+ID4gPiBIb3cgdGhp
cyBoYXBwZW4/IElmIGlycSBoYW5kbGVyIHJ1bm5pbmcsIGhhcmR3YXJlIChyZWFsIElCSSkgd2ls
bCB0cmlnZ2VyCj4gPiA+IGlycSBsaW5lIGJlZm9yZSBpdC4KPiA+ID4KPiA+ID4gRG8geW91IGVu
YWJsZSBvdGhlciB0eXBlIGlycT8KPiA+ID4KPiA+ID4gRnJhbmsKPiA+Cj4gPiBIaSBGcmFuaywK
PiA+Cj4gPiBPbmx5IFNMVlNUQVJUIGludGVycnVwdC4gQmVsb3cgaXMgdGhlIHNlcXVlbmNlOgo+
ID4gLSBIVyByYWlzZXMgYSBmYWxzZSBTTFZTVEFSVCBpbnRlcnJ1cHQuCj4gPiAtIFRoZSBJUlEg
aGFuZGxlciBsYXRjaGVzIHRoZSBNU1RBVFVTIHJlZ2lzdGVyLgo+ID4gLSBCZWZvcmUgdGhlIGhh
bmRsZXIgY2xlYXJzIHRoZSBTTFZTVEFSVCBzdGF0dXMsIGEgcmVhbCBJQkkgcmVxdWVzdCBhcnJp
dmVzLgo+ID4gLSBIVyB1cGRhdGVzIHRoZSBTTFZSRVEgc3RhdGUgdG8gaW5kaWNhdGUgYSBwZW5k
aW5nIElCSS4KPiA+IC0gVGhlIGhhbmRsZXIgY29udGludWVzIHVzaW5nIHRoZSBzdGFsZSBNU1RB
VFVTIHNuYXBzaG90LCBkb2VzIG5vdCBzZWUKPiA+ICAgdGhlIG5ldyBTTFZSRVEgc3RhdGUsIGFu
ZCByZXR1cm5zIGVhcmx5Lgo+Cj4gQmVjYXVzZSByZWFkaW5nIHJlZ2lzdGVyIGFuZCBJQkkgcmVx
dWVzdCBhcnJpdmluZyBhcmUgdG90YWxseSBhc3luYwo+Cj4gcmVhZGwobWFzdGVyLT5yZWdzICsg
U1ZDX0kzQ19NU1RBVFVTKSwgIG1heSByZXR1cm4gdHdvIHJlc3VsdHMKPiAxLiBiZWZvcmUgSUJJ
IHJlcXVlc3QKPiAyLiBhZnRlciBJQkkgcmVxdWVzdAo+Cj4gSG93IGRvIHlvdSBtYWtlIHN1cmUg
c2Vjb25kIHJlYWRsKG1hc3Rlci0+cmVncyArIFNWQ19JM0NfTVNUQVRVUykgYWx3YXlzCj4gZ2V0
IHRoZSByZXN1bHQgb2YgYWZ0ZXIgSUJJIHJlcXVlc3QuCj4KPiBGcmFuawoKSGkgRnJhbmssClRo
ZSBvcmRlcmluZyBiZXR3ZWVuIHRoZSBzZWNvbmQgcmVhZGwoTVNUQVRVUykgYW5kIHRoZSByZWFs
IElCSSBhcnJpdmFsIGlzCm5vdCBjcml0aWNhbCwgYXMgbG9uZyBhcyB0aGUgc2Vjb25kIHJlYWQg
aXMgcGVyZm9ybWVkIGFmdGVyIGNsZWFyaW5nIFNMVlNUQVJULgoKVGhlcmUgYXJlIHR3byBjYXNl
czoKMS4gSUJJIGFycml2ZXMgYmVmb3JlIHRoZSBzZWNvbmQgcmVhZApBZnRlciBTTFZTVEFSVCBp
cyBjbGVhcmVkLCBIVyBoYXMgYWxyZWFkeSB1cGRhdGVkIHRoZSBTTFZSRVEgc3RhdGUsIHNvIHRo
ZQpzZWNvbmQgTVNUQVRVUyByZWFkIGNhbiBvYnNlcnZlIHRoZSBwZW5kaW5nIElCSSBhbmQgaGFu
ZGxlIGl0IGluIHRoZSBzYW1lCklSUS4KCjIuIElCSSBhcnJpdmVzIGFmdGVyIHRoZSBzZWNvbmQg
cmVhZApFdmVuIHRob3VnaCB0aGUgc2Vjb25kIE1TVEFUVVMgcmVhZCBkb2VzIG5vdCByZWZsZWN0
IHRoZSBwZW5kaW5nIElCSSwgdGhlCklCSSB3aWxsIGFzc2VydCBTTFZTVEFSVCBhZ2Fpbi4gQSBu
ZXcgaW50ZXJydXB0IHdpbGwgYmUgZ2VuZXJhdGVkCmFmdGVyIHRoZSBjdXJyZW50CmhhbmRsZXIg
cmV0dXJucywgYW5kIHRoZSBwZW5kaW5nIElCSSBpcyBoYW5kbGVkIGluIHRoZSBuZXh0IElSUS4K
ClRoYW5rcy4KCj4KPiA+IC0gVGhlIHJlYWwgSUJJIGlzIG1pc3NlZCBhbmQgbm8gZnVydGhlciBp
bnRlcnJ1cHQgaXMgZ2VuZXJhdGVkLgo+ID4KPiA+IFRoYW5rcy4KPiA+Cj4gPiA+Cj4gPiA+ID4g
SFcgc2V0cyB0aGUgU0xWUkVRIHN0YXRlLiBIb3dldmVyLCB0aGUKPiA+ID4gPiBoYW5kbGVyIHN0
aWxsIHJlbGllcyBvbiB0aGUgc3RhbGUgTVNUQVRVUyBzbmFwc2hvdCwgcmV0dXJucyBlYXJseSwg
YW5kCj4gPiA+ID4gbWlzc2VzIHRoZSByZWFsIElCSS4gTm8gZnVydGhlciBpbnRlcnJ1cHQgaXMg
Z2VuZXJhdGVkIGZvciB0aGlzIHBlbmRpbmcKPiA+ID4gPiBJQkkuCj4gPiA+ID4KPiA+ID4gPiBS
ZS1yZWFkIE1TVEFUVVMgdG8gb2J0YWluIHRoZSBsYXRlc3Qgc3RhdGUgYW5kIGF2b2lkIG1pc3Np
bmcgYSByZWFsIElCSQo+ID4gPiA+IGR1ZSB0byB0aGlzIHJhY2UgY29uZGl0aW9uLgo+ID4gPiA+
Cj4gPiA+ID4gRml4ZXM6IDRkZDEyZTk0NGYwNyAoImkzYzogbWFzdGVyOiBzdmM6IEZpeCBucGNt
ODQ1IGludmFsaWQgc2x2c3RhcnQgZXZlbnQiKQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFN0YW5s
ZXkgQ2h1IDx5c2NodUBudXZvdG9uLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgZHJpdmVycy9p
M2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgfCAxNiArKysrKysrKysrKystLS0tCj4gPiA+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4gPiA+
Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5j
IGIvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiA+ID4gPiBpbmRleCBiODRi
MzI0ZTQxMTEuLjdkODhlOGZlMzc0MiAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2kzYy9t
YXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9z
dmMtaTNjLW1hc3Rlci5jCj4gPiA+ID4gQEAgLTY3MiwxMCArNjcyLDE4IEBAIHN0YXRpYyBpcnFy
ZXR1cm5fdCBzdmNfaTNjX21hc3Rlcl9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkZXZfaWQp
Cj4gPiA+ID4gICAgICAgLyogQ2xlYXIgdGhlIGludGVycnVwdCBzdGF0dXMgKi8KPiA+ID4gPiAg
ICAgICB3cml0ZWwoU1ZDX0kzQ19NSU5UX1NMVlNUQVJULCBtYXN0ZXItPnJlZ3MgKyBTVkNfSTND
X01TVEFUVVMpOwo+ID4gPiA+Cj4gPiA+ID4gLSAgICAgLyogSWdub3JlIHRoZSBmYWxzZSBldmVu
dCAqLwo+ID4gPiA+IC0gICAgIGlmIChzdmNfaGFzX3F1aXJrKG1hc3RlciwgU1ZDX0kzQ19RVUlS
S19GQUxTRV9TTFZTVEFSVCkgJiYKPiA+ID4gPiAtICAgICAgICAgIVNWQ19JM0NfTVNUQVRVU19T
VEFURV9TTFZSRVEoYWN0aXZlKSkKPiA+ID4gPiAtICAgICAgICAgICAgIHJldHVybiBJUlFfSEFO
RExFRDsKPiA+ID4gPiArICAgICBpZiAoc3ZjX2hhc19xdWlyayhtYXN0ZXIsIFNWQ19JM0NfUVVJ
UktfRkFMU0VfU0xWU1RBUlQpKSB7Cj4gPiA+ID4gKyAgICAgICAgICAgICAvKgo+ID4gPiA+ICsg
ICAgICAgICAgICAgICogUmUtcmVhZCBNU1RBVFVTIHRvIG9idGFpbiB0aGUgbGF0ZXN0IHN0YXRl
IGFuZCBhdm9pZAo+ID4gPiA+ICsgICAgICAgICAgICAgICogbWlzc2luZyBhbiBJQkkgdGhhdCBh
cnJpdmVzIGFmdGVyIE1TVEFUVVMgaXMgbGF0Y2hlZAo+ID4gPiA+ICsgICAgICAgICAgICAgICog
YnV0IGJlZm9yZSBTTFZTVEFSVCBpcyBjbGVhcmVkLgo+ID4gPiA+ICsgICAgICAgICAgICAgICov
Cj4gPiA+ID4gKyAgICAgICAgICAgICBhY3RpdmUgPSByZWFkbChtYXN0ZXItPnJlZ3MgKyBTVkNf
STNDX01TVEFUVVMpOwo+ID4gPiA+ICsKPiA+ID4gPiArICAgICAgICAgICAgIC8qIElnbm9yZSB0
aGUgZmFsc2UgZXZlbnQgKi8KPiA+ID4gPiArICAgICAgICAgICAgIGlmICghU1ZDX0kzQ19NU1RB
VFVTX1NUQVRFX1NMVlJFUShhY3RpdmUpKQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gSVJRX0hBTkRMRUQ7Cj4gPiA+ID4gKyAgICAgfQo+ID4gPiA+Cj4gPiA+ID4gICAgICAg
LyoKPiA+ID4gPiAgICAgICAgKiBUaGUgU0RBIGxpbmUgcmVtYWlucyBsb3cgdW50aWwgdGhlIHJl
cXVlc3QgaXMgcHJvY2Vzc2VkLgo+ID4gPiA+IC0tCj4gPiA+ID4gMi4zNC4xCj4gPiA+ID4KCi0t
IApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
