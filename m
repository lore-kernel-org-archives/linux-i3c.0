Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2366ECAC59A
	for <linux-i3c@archiver.kernel.org>; Thu, 18 Sep 2025 10:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TXCmvRKTEwPxWamOBIvLllIBNFumr4/Uqy6hEQu2jWs=; b=PdIhXaQRVvyEUm
	LwVgp5l2zcDH5r1mfTD8owZ5WA0b2/K0C3okTSSVq+Trxq/aWE2fZXjvZcBa74oGjh7oC/d1WBa/Z
	1FNUzmWfuk1YUOV5a2cCLNz6ZIfQez+6vCA++3ntHalwKFaxvghwIDrSvAyrGDwmwqRR2OlIIRgXe
	eZ+3UfMq7gHqek0G9odfAXUayO8USeDMnhVRd1bJLiLsKKdrtmqLuiMB9hTHK+cWQrgylEfr+WCjf
	zjXtZEkrBPbrLyMEJw3RDntKU5zXLyOmcFyeqSaOqlR13kIS8XsmvD2OkC8AT5VCzuYbckmYcOvzI
	NAECjnsu3b+PKYDUAuuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBiX-0000000H169-3bLJ;
	Thu, 18 Sep 2025 10:18:21 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uySjl-00000007UPU-3AxR
	for linux-i3c@lists.infradead.org;
	Tue, 16 Sep 2025 10:16:38 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-46070cf4dc5so534825e9.1
        for <linux-i3c@lists.infradead.org>; Tue, 16 Sep 2025 03:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758017795; x=1758622595; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VmZzhETWZwgrAXAyoyBia2dF4hbrFav1Sum4dtojLBk=;
        b=WRw4GuNtGda27L+k/69B6kRW4D6/3OY1pKSdPv230sVV154PutcdQLK0MftkBrmhVG
         Nzr1M9/oW/3ybCY2HnO+H1DqKOkLYwvD8iVA1KFXGFoN1/UFYpB/aGP6X+7U3+7Rj477
         lUGityz7Uh9IpPf7zN88D45B2mG9YWlHnSZTclbJxvkMl7FN0zuSMgGp7apLFHMYWXkL
         zv5sdX3lxXQWrLj6VG7LeEpzcwNGdcDjGj32q+ISsyLFtty8Ilr+7lMzg0Dw93rKMApT
         1LpajpD4raAVaNN18bxwqT1fzYvmIzeYFsTskGKTQ0TT/EJTm6AqTM6ivWHU4aezBx7C
         T1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758017795; x=1758622595;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VmZzhETWZwgrAXAyoyBia2dF4hbrFav1Sum4dtojLBk=;
        b=XgGWHb3vPzrS6urPysFY+yzT4doIsudJwH4EGj7zgneO/ejcWBOZoys5BQKs73Jln3
         pu24ZtrFXVGngZIy+dCcH+gIGFfRZAMogLNCc2cYHhPpZX+SNtcS2b1O5EooblsiUGYy
         LZ0vaI3sKeIDie+e3Mh3+0tz79bmTlDRJHysM5Pm3Xb3HN9aXFtMwMJ2TkVzFXSQqZo0
         srIE55M9/nY504PBXlcRIWEc8iJM0VWPVOXCVT7zhvkqiEabpAl7h5VLuiOsIK0mVLvA
         5n+JYhl7l8i3mkUyLRDT624JARv2xHFXQ1uGFJjd5O/nBFEAwqXZ0EgaErQB4OWUd/C3
         RkZA==
X-Gm-Message-State: AOJu0YwQRXy3Hc6jS9eYHTIkNi/6uJMgHtsNWHVXMCk9fB1Qd1O9z9+Z
	lCrrtS8moGTS3LJ3dE6GaEaGccqiphX03L80Q5euzJ2Gj9MeNksBhgSI
X-Gm-Gg: ASbGnctImB5ZMtVTqueTO+O2eOvlBAb7/ip2TFPMN1vfpOfpOf78Ic+2k61gx05drnA
	6pJfjEiwcp+kYm480w37K8FsVoqherruR6aPsj2L4iwZVh/SoQZlD1eUXYv/lLSto3/GvxSLeJW
	x2vCCwkjA1tPWFS9auhb1E2zI11PedELwOIIWNgRyTHKZS8x6sFY7v2qUvgEzB9o3kAzc8wW6KB
	OdGuB9P7yxWQrgD8HeD/J2Y2+D7KNOJSkQSgdi4j4Gnwz9GgFg7Ipf8thkiGwt+NbehscujMeY+
	BtZu7NLfNCvneN9O1XTgYl7t2NrfRjBplMLjXg+eU4hHs1U513IJ+TY2zMeYTY4/RTp5BNq/YTZ
	gTRLdewqGXrfkI7WxSkdN4otvotWFWS8=
X-Google-Smtp-Source: AGHT+IEsDQnZ3ALRjZKNZkTIB6aa3ymyhHeIfAjtkOgrgqYBTsLvorpYR1r3Og+DA0Xw9SYb3SSGQg==
X-Received: by 2002:a05:6000:1acb:b0:3e5:d2f1:403d with SMTP id ffacd0b85a97d-3e7659e981fmr16107836f8f.36.1758017795283;
        Tue, 16 Sep 2025 03:16:35 -0700 (PDT)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037b9ebbsm229691635e9.11.2025.09.16.03.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:16:34 -0700 (PDT)
Message-ID: <bb6ab3f73b6f18d7e8c37c28481a13a7808ba44e.camel@gmail.com>
Subject: Re: [PATCH] i3c: master: adi: fix header location
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: alexandre.belloni@bootlin.com, Jorge Marques <jorge.marques@analog.com>,
  Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 16 Sep 2025 11:17:00 +0100
In-Reply-To: <20250916091252.39265-1-alexandre.belloni@bootlin.com>
References: <20250916091252.39265-1-alexandre.belloni@bootlin.com>
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_031637_801406_5A608C91 
X-CRM114-Status: GOOD (  10.81  )
X-Mailman-Approved-At: Thu, 18 Sep 2025 03:18:20 -0700
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

T24gVHVlLCAyMDI1LTA5LTE2IGF0IDExOjEyICswMjAwLCBhbGV4YW5kcmUuYmVsbG9uaUBib290
bGluLmNvbSB3cm90ZToKPiBGcm9tOiBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxv
bmlAYm9vdGxpbi5jb20+Cj4gCj4gVGhlIGFkaS1heGktY29tbW9uIGhlYWRlciBoYXMgYmVlbiBt
b3ZlZCB0byB0aGUgdXBwZXIgZGlyZWN0b3J5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRy
ZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT4KPiAtLS0KCkFja2VkLWJ5
OiBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPgoKPiDCoGRyaXZlcnMvaTNjL21hc3Rlci9h
ZGktaTNjLW1hc3Rlci5jIHwgMiArLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9hZGkt
aTNjLW1hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL2FkaS1pM2MtCj4gbWFzdGVyLmMKPiBp
bmRleCAxNjJmOWVlZDM5YWEuLjE4NTk3YmExZjFjMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kz
Yy9tYXN0ZXIvYWRpLWkzYy1tYXN0ZXIuYwo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9hZGkt
aTNjLW1hc3Rlci5jCj4gQEAgLTEwLDcgKzEwLDcgQEAKPiDCoCNpbmNsdWRlIDxsaW51eC9jbGsu
aD4KPiDCoCNpbmNsdWRlIDxsaW51eC9lcnIuaD4KPiDCoCNpbmNsdWRlIDxsaW51eC9lcnJuby5o
Pgo+IC0jaW5jbHVkZSA8bGludXgvZnBnYS9hZGktYXhpLWNvbW1vbi5oPgo+ICsjaW5jbHVkZSA8
bGludXgvYWRpLWF4aS1jb21tb24uaD4KPiDCoCNpbmNsdWRlIDxsaW51eC9pM2MvbWFzdGVyLmg+
Cj4gwqAjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+Cj4gwqAjaW5jbHVkZSA8bGludXgvaW8u
aD4KCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNj
Cg==
