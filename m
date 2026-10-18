Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79ABCCCF2C4
	for <linux-i3c@archiver.kernel.org>; Sun, 18 Oct 2026 20:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MdTNUW6e5W1Ct1zx3oGCNa6wdlNauDVzoBv0Bk5nRj4=; b=ZX5qbIM4arzAp9
	aK2QBFkBEZIZUoccv1QtTtDvwHpdJlgf6SywmBZd4x4xTwsLCYmlZZmELGoZ+iW5klPTfpK8oen7m
	fdidCmlNjlmB/DLSktsLdDEV39ILEmjYkdKt9Vb0A3Kqpy+DUmUDWI18zPajuNFyv0KblTljD/DJ/
	3p9CMS0iTQ3MiKrLzlaaK1qOo9IV2kg/vgDCpjFHrWuNBIs7nkLfpXHa2Yl2set2SKJQi3MgjhMlA
	stgzsaEmSNfvIqULtKrHSfDsJI6/F2F3pWXBIsEFdTy2QhVHJjXVHmS/XzSRMJW6+2uiWKN2j2MiF
	sPsZpIEeEhm9F0GbEFaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIXV8-00000006CsS-0Yov;
	Sun, 18 Oct 2026 20:29:02 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIXV4-00000006Crr-48bI
	for linux-i3c@lists.infradead.org;
	Sun, 18 Oct 2026 20:29:00 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-679334baa1fso1301415d50.2
        for <linux-i3c@lists.infradead.org>; Sun, 18 Oct 2026 13:28:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792355336; cv=none;
        d=google.com; s=arc-20260327;
        b=Xey8joK7klxs56/WIpZboDxOQfZSSGE6ydLVtxNsYSxFh0PKpHBqZ1ajT+rHWFJner
         NLDtI+v2Tfe9rkNR/Kpc4+tZzteT7oO9slXFSiDQAPQ7qcN2W2M07y2cH4faFi49s/dL
         CAK4dQs7SyQlNz7nJljwYFKnL6yB6MIzudGhrXdKSVuMEIIkxRM5MkiV5Sd5cnfeDgrd
         TU1F5wPPdKeMCZ6HB8leEm86+GIBPdclRZhc//bchchsBDpGFjfltd5OaXY12WA0NwCw
         CRPKw1z/dwauf5ZR/5/lrbgQQjgsYF6wmR28dUTC53pv/lLvFirpH4BtQWWsCHpsV6XL
         ChpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b5hzFXuS/ZaPKWwYVS/ZTQhs479P1FbROJSqXhgoLZs=;
        fh=1TZH/4MCFCXGxgiKlqaVDNQwKlZzX/MO7VCEGIt8CdM=;
        b=sR+ldum0iwdEpnSDiUzmwbL70V0SBUBo0TsOxYg4Q3PBPCd7j5UDIWc/mqWC0C2Ecf
         yhw2TqA69omqR25zENTIxn/tLieqU5tLrUd6TNLyc8k+ahCK2j5mrQUOpG0BSnRcL75n
         r1sdXgs+GtUihtpMVPbYI88kv5iQPpCPkMXx2havfLIiZfptsnfPaWIiHRV0TihIDrQO
         merlc8ZZiajIZ8LT6juj3UAOfIuzngxEMr7rmgTZrHpAo4ehmizQmYS4zm+JfgO+EWLS
         oVnrBtkjLXocL4cHhy7gRvZ/+Lmi7fXdwvN5RCjN57ROdY67bCImQ2djsxl0cOyoZeic
         GNNg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792355336; x=1792960136; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b5hzFXuS/ZaPKWwYVS/ZTQhs479P1FbROJSqXhgoLZs=;
        b=aBblpy8FReSDOE+pkweE4pQcTB6FKsQqjESvZkzWCwuI2x4H70TtD67yhr7YyWR6mq
         TJZAy/Sf4wzERngz4v4psCw0+HSvo07auXD833TpWJYLRSFkIy6Dn+7kVD1OOyqdZkMM
         1Q/OqIeuY0mzEQBkDdkgbQSnoYlIP61Rtw25YgjadB2IHBFAMhdIP383WAxWxTlhVM9x
         OtNY/csDak8hxuczCLsqb+JiuvatW01GyLyXD1s76D5pcV1sBBx40uSk6Byriqp9eGGY
         oTwaJmFeWcRRZeyWHzTp8kuEuccH8Gokh66wp9Epmz/1PCzPYB7mfAegrp+cu3kkQsq8
         AgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792355336; x=1792960136;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b5hzFXuS/ZaPKWwYVS/ZTQhs479P1FbROJSqXhgoLZs=;
        b=S4he7L6hpJIX7aePfM1MRCBTo6DalgqSh55LGczAdVkQ7U+Tqrs2DJFxZNLF4vlqEW
         kWFBc4AIjja6xokK9nguS3EwhGO7IBZJxZoe35PGxMYqxbvct4/0nBQlObTvBP0NSI/k
         1zSJ8V9q9zYqnLrtqXhd1058co9hMqf+IzUL2L6wWavzdok2BgKeFBHPucRVNfg0J7zQ
         ExkCDH3Dh3UhGrbuphCEz3G3KL0Cw4RY+7zDlgAhm275Yn4sotrFEjA51itPx/vklL/r
         nXnf+bQ6Zk/KeDc0ueT+495ZdpufnsDZFyMow+i0KkdDYHfJv5d96IXk6su9IZEiHTMZ
         P4JQ==
X-Forwarded-Encrypted: i=1; AKwUvBxM2SN8012g3H2TIaIu2fiSxqIbinNDicAcvSHrhHKlLeR4cYZuNqdaDpmNSUGU5JnZ+S6UxLhOn5A=@lists.infradead.org
X-Gm-Message-State: AFq9FYL/tHdjG7UN0MrhxnfKK7xTdjyc6x4oUcUtaE3IJHB7VJPFS08m
	HZdlxKw02W690SNTPWdaj8M1pwXFVosNEDvbgCOT9CvcJvwgg0Mx4GkfWMzj3eSD+95UA+DSNRG
	EL6p9ape5qlk3VTE0poyZNnaRXxft1drJFOKydJCl
X-Gm-Gg: AYBFou0RLLaUcuBQe6W3Q7Lkvdt9KzEtpyTS9Hmbf/ZKd99HBWF9wEjCYuzZTLNIT1d
	g105ptDDgVxLTNZjb0m/WZqrMl3zkVeWe0kQvvJcC9wbqkRysdnC1AKuoWMAAQJ6n3DFbNm4bhD
	C7enCyQi+UvagHSAW9VcLHZvU2LLhOqzQ4EhOh6Wmsx5z4DBlBX4YI3zPFqUdGB7fApodPV+DCo
	O2grtCdkmjsx3r8q+Ot7jUAJ/6c+XKWa0pPUbhYANA4FxQAMnU0zd0q6ajwr/rxH5xo3Qz3vOh8
	BKOCmjPqYefzjiYBlH+Oc9Z+T3H89IttDGGkIn7jKdtqIXqqaOFO/7NNd1nacoto5dyU+plpt/Q
	pf/+43Bg+QA==
X-Received: by 2002:a05:690e:118e:b0:679:2a5f:52d3 with SMTP id
 956f58d0204a3-679ca95a0c8mr1537687d50.161.1792355335893; Sun, 18 Oct 2026
 13:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <arY6DfVf_9tZ_TCu@black.igk.intel.com> <arZTphXbVF5wagy2@shikoro>
 <CAHreonFzhYk6fDswn7OVZfL3ybUHU15G3_q9+1sDhe8h670r3A@mail.gmail.com> <as487H8-0Gc77mXI@ashevche-desk.local>
In-Reply-To: <as487H8-0Gc77mXI@ashevche-desk.local>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Sun, 18 Oct 2026 13:28:44 -0700
X-Gm-Features: AclHuK8PXQM2VfsIRVEDKyHaajGYEQ3CpfznmQSW3MY9pGrSxyVsVdcPzi-iqk4
Message-ID: <CAHreonHiesGbR4VB+3sRxoLDmNHXFFEB=6_o6TNedm-N6VksEQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] i3c: add i3cdev module to expose i3c dev in /dev
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Adrian Hunter <adrian.hunter@intel.com>, Meagan Lloyd <meaganlloyd@linux.microsoft.com>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_132859_071860_E06589E5 
X-CRM114-Status: GOOD (  17.05  )
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

PiBZZXMgYW5kIG1vcmUgYXMgdGhpcyBidXMgKGkzYykgaXMgc3RpbGwgbm9uLWRpc2NvdmVyYWJs
ZSAoYW0gSSBtaXN0YWtlbj8pLgoKSTNDIGlzIGEgZHluYW1pY2FsbHkgZGlzY292ZXJhYmxlIGJ1
cy4gRHVyaW5nIERBQSBlYWNoIEkzQyB0YXJnZXQgcmVwb3J0cyBhClByb3Zpc2lvbmVkIElEIChQ
SUQpLCBCdXMgQ2hhcmFjdGVyaXN0aWMgUmVnaXN0ZXIgKEJDUiksIGFuZCBEZXZpY2UKQ2hhcmFj
dGVyaXN0aWMKUmVnaXN0ZXIgKERDUiksIGFuZCBpcyBhc3NpZ25lZCBhIGR5bmFtaWMgYWRkcmVz
cyBieSB0aGUgY29udHJvbGxlci4KCj4gVGhpcyBtYWtlcyBldmVuIGxlc3MgdXNlZnVsbmVzcyBp
biBteSBleWVzLiBJbW1lZGlhdGUgUTogaWYgNCBhbHJlYWR5IGhhdmUgdGhlCj4gcHJvcGVyIGRy
aXZlciBpbiB0aGUga2VybmVsLCB3aGF0J3Mgd3JvbmcgdG8gbWFrZSBpdCBmb3IgdGhlIGZpZnRo
IG9uZT8KCjEuIFRoZSBvcmlnaW5hbCB1c2UgY2FzZSB3YXMgaGFyZHdhcmUgYnJpbmctdXAsIHNp
bGljb24gdmFsaWRhdGlvbiwgYW5kIGRlYnVnCihpM2N0cmFuc2Zlcik6IEp1c3QgbGlrZSBzcGlk
ZXYsIGVuZ2luZWVycyBuZWVkIGEgZGVidWcgaW50ZXJmYWNlCnRvIGlzc3VlIGFkLWhvYyBTRFIv
SERSIHRyYW5zZmVycyBkdXJpbmcgYnJpbmctdXAgb3IgaGFyZHdhcmUgdmFsaWRhdGlvbiBiZWZv
cmUKYSBkcml2ZXIgZXhpc3RzLgoKMi4gVXNlcnNwYWNlIGZpcm13YXJlIHJlY292ZXJ5IC8gdXBk
YXRlIHRvb2xzIChPQ1AgU2VjdXJlIEZpcm13YXJlClJlY292ZXJ5LCBDYWxpcHRyYSBSb1QpOgpU
aGUgcmVjb3ZlcnkgcHJvdG9jb2wgaXMgcHVyZWx5IGEgcG9sbGVkIHJlcXVlc3QvcmVzcG9uc2Ug
dHJhbnNwb3J0CihubyBJQklzIGFsbG93ZWQgcGVyIHNwZWMpCnVzZWQgYnkgdXNlcnNwYWNlIHVw
ZGF0ZSB0b29saW5nIChmd3VwZCAvIEJNQyByZWNvdmVyeSBkYWVtb25zKSB0bwpwYXJzZSBzaWdu
ZWQgZmlybXdhcmUKbWFuaWZlc3RzLCBzdHJlYW0gcmVjb3ZlcnkgaW1hZ2UgY2h1bmtzIHRvIElO
RElSRUNUX0ZJRk9fREFUQSwgYW5kCnBvbGwgUkVDT1ZFUllfU1RBVFVT4oCUc2ltaWxhcgp0byBo
b3cgdXNlcnNwYWNlIGZpcm13YXJlIHVwZGF0ZXJzIG9wZXJhdGUgb3ZlciBzcGlkZXYsIGhpZHJh
dywgb3IKVVNCL05WTWUgaW9jdGxzIHJhdGhlciB0aGFuCnB1dHRpbmcgZmlybXdhcmUgaW1hZ2Ug
cGFyc2luZyBhbmQgdXBkYXRlIHBvbGljeSBpbnNpZGUgdGhlIGtlcm5lbC4gSW4KbXkgcmVzcG9u
c2UgdG8KV29sZnJhbSBhYm92ZSBJIGRpc2N1c3NlZCB0aGlzIHNvbWUgbW9yZS4KCj4gV2hhdCBp
ZiB0aGUgZGV2aWNlIG5lZWRzIG1vcmU/IE9yIGlmIHRoaXMgaXMgYSBtdWx0aS1mdW5jdGlvbmFs
IGRldmljZSB0aGF0Cj4gbWF5IGhhdmUgZHJpdmVyIGZvciBvbmx5IG9uZSBwYXJ0PwoKSWYgYSBk
ZXZpY2UgbmVlZHMgbW9yZSB0aGFuIGJhc2ljIHRyYW5zZmVycyAoc3VjaCBhcyBJQklzLApob3Qt
am9pbiBoYW5kbGluZywgb3IgaW50ZWdyYXRpb24gd2l0aCBhIHN1YnN5c3RlbSBsaWtlIGh3bW9u
L2lpby9tY3RwKSwKaXQgc2hvdWxkIHVzZSBhIGRlZGljYXRlZCBrZXJuZWwgZHJpdmVyLgoKRm9y
IG11bHRpLWZ1bmN0aW9uIGRldmljZXMsIGlmIHRoZSBmdW5jdGlvbnMgYXJlIGV4cG9zZWQgYXMg
TUlQSSBJM0MKVGFyZ2V0cyAoZS5nLiBhIGRldmljZSBleHBvc2luZyBib3RoIGFuIG1jdHAtaTNj
IGludGVyZmFjZSBhbmQKYW4gT0NQIHJlY292ZXJ5IGludGVyZmFjZSksIGVhY2ggdmlydHVhbCB0
YXJnZXQgaXMgYXNzaWduZWQgaXRzIG93bgpkeW5hbWljIGFkZHJlc3MgYW5kIERDUiBkdXJpbmcg
RU5UREFBIGFuZCBpcyBlbnVtZXJhdGVkIGFzIGEgZGlzdGluY3QKaTNjX2RldmljZSBpbnN0YW5j
ZSBvbiB0aGUgYnVzLiBDb252ZXJzZWx5LCBpZiBtdWx0aXBsZSBmdW5jdGlvbnMgc2hhcmUKYSBz
aW5nbGUgSTNDIHRhcmdldCBhZGRyZXNzIGFuZCByZWdpc3RlciBtYXAsIGkzY2RldiBpbnRlbnRp
b25hbGx5IGRvZXMKbm90IGFsbG93IHVzZXJzcGFjZSB0byBhY2Nlc3MgYSB0YXJnZXQgd2hpbGUg
YSBrZXJuZWwgZHJpdmVyIGlzIGJvdW5kCnRvIGl0IChhdm9pZGluZyB0aGUgSTJDX1NMQVZFX0ZP
UkNFIHByb2JsZW0gd2hlcmUgdXNlcnNwYWNlIGNhbiByYWNlCndpdGggYSBib3VuZCBkcml2ZXIp
LCBzbyB0aGF0IGNhc2Ugc2hvdWxkIGJlIGhhbmRsZWQgYnkgYW4gaW4ta2VybmVsCk1GRCBkcml2
ZXIgLSBidXQgdGhhdCBpcyBub3QgdGhlIHVzZSBjYXNlIGJlaW5nIHRhcmdldGVkIGhlcmUgd2l0
aCBPQ1AKcmVjb3ZlcnkuCgoKCj4gV2hhdCB0byBkbyB3aXRoIHRoZSBpMmMgZGV2aWNlcyBjb25u
ZWN0ZWQgdG8gaTNjIGJ1cyBpbiB0aGUgY29tcGF0aWJsZSBtb2RlPwoKSTNDIG1hc3RlciBjb250
cm9sbGVycyByZWdpc3RlciBhbiBpMmMgYWRhcHRlciBmb3IgaTJjIGRldmljZXMgcnVubmluZyBv
biBhbgppM2MgbWl4ZWQgbW9kZSBidXMgLSB0aGV5IGFyZSBpZGVudGlmaWVkIGFzIGkyY19idXNf
dHlwZSwgbm90IGkzYy4KClRoYW5rcywKU2FtCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdAps
aW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
