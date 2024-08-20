Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D39C52D6F
	for <linux-i3c@archiver.kernel.org>; Tue, 20 Aug 2024 01:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xk87Rm7zpcrg2Cie2E2b+TkHw5+9bQE1kmmOXgJNSGE=; b=he+RuhqoshAWwq
	Visjxi6winVwTrZwwjU0gKwILQeT/8GpDdjPAgqcbTMKWq7WX2bZ2BnUMmCZsJE3TD1uxOKg/Any0
	v4G17sMuON3gG1uqoELuuHrZ7mYGTFbSYaJ88OmeZjkz3Ww6xhu5gFde8EACmZ0ums3/UBSd8x8A9
	i0WiYBWLLW4PvE5zZY4aTiTejDbOWg8aGk+upkcIjIArkxFEw1TdXzyT/mKGRcT1zjw3/gSRn80Mb
	p8ZbLje2CNY7D8ctMx4EFS4TuuI0volX3dg2kU/VHeTwcGa7jribHCC9mtjCfttZLDIZ+oaU/vEk0
	+Ofr0RooHipLdDFHMNbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgDlT-00000003Rda-1Owt;
	Tue, 20 Aug 2024 01:34:27 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgDlQ-00000003Rco-1IWG
	for linux-i3c@lists.infradead.org;
	Tue, 20 Aug 2024 01:34:26 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-81fdf584985so14214139f.1
        for <linux-i3c@lists.infradead.org>; Mon, 19 Aug 2024 18:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724117663; x=1724722463; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zz0yf1/Y0q98UkeCNc6m4P8pN/IvsoVhD8EtrTurEF8=;
        b=UyNRFSMxQBrOfZ0Zb8UXNwoMLQfXnKqFBjHkNvvxLb75qZz7elYNqTA0TcIFH057q1
         7xurIWDEfDCD5Y+asanz0GWFFSa2ZOnyYvp/CQ0ktmiwezTWK8Jh/60i41T3W64+cBz0
         5xqPI1Hiw297hToSkgoKT6abR1EeOpe9YeQj2rLKAAbhgwb+gsBNEKV4f9DyvH/CZBH0
         UeF/wcdHoDxtVsF6fLzUMAojyIEgyl+gsNQVE+PtmSiLqwcUIT1l1r433oJqKpJ6mMpW
         Ub2BK6X80kkRs8MPFqvJjPppX69Mf51Yt/P+5Mwrhxo8PLjrA0gCuZOmretbPTVZhehM
         bYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724117663; x=1724722463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zz0yf1/Y0q98UkeCNc6m4P8pN/IvsoVhD8EtrTurEF8=;
        b=iMRSOo5wflMF5In0awma63oMPLdPvJOMQTutNgkJiDI/lWq2+VrPdWMKgz9IURMHdl
         e3zanCSQ8JscIENcnDhw1r7z/uVeuJMSNTbwnK7sXnXjVBQeF3i313s2NXspBZ9SwgKx
         gUnj/XeqFHMBpDBPK1d+9e59+8z+wF6NbPrcBQr/JVqbgHtclTWF5Pt0s0op61aQR+S8
         rmEG0sLgHD9tFjYEXwb0dieW6HYZ1WWhfRK50Vx1Qa/DNvXQLq+jaYUlJSQDFJw+ZO29
         osuZS3r90EB0KVXJuxP5KZR/i+DQzjTe3jaos7xcttaEgnX1R6mMc+GUeUh8p9yYvDfr
         jrxg==
X-Forwarded-Encrypted: i=1; AJvYcCX/1r3kxZX4cTQLfQDBL/zubrjyRd9JqjRaef1i/7Eyv+YMJ3i+yIF247tHmMsY62WUpkboJW3Cgrs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWE0Uslljh3XxBZba6G7Lr+J888CbVuYIIixZIBQ+aIIntRYHe
	LE9tpTapp5fJrpNn8jAxFjk716qDr9YFzIGSFGluBGMkNJpdhXBn7uFUFx421E9LNLgX4NDkCUR
	YM167U1TbKL7wXkx/RBNUSKRliEQ=
X-Google-Smtp-Source: AGHT+IH2AsFaMWdba8AOgcnp+2GFW/3VG5Vj4/V/h1JYgxxD5JHekYstIjqy6bOiXsUFWjTCM1F2jVROifOBG4WowQo=
X-Received: by 2002:a05:6e02:1d0e:b0:39a:f126:9d86 with SMTP id
 e9e14a558f8ab-39d27963062mr82986245ab.0.1724117662736; Mon, 19 Aug 2024
 18:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com> <20240819-i3c_fix-v3-1-7d69f7b0a05e@nxp.com>
In-Reply-To: <20240819-i3c_fix-v3-1-7d69f7b0a05e@nxp.com>
From: Stanley Chu <stanley.chuys@gmail.com>
Date: Tue, 20 Aug 2024 09:34:11 +0800
Message-ID: <CAPwEoQOXme+GofEhpXaBBmsyGJP-QQtLMJG45PTdNsSqFn391w@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] i3c: master: Remove i3c_dev_disable_ibi_locked(olddev)
 on device hotjoin
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Parshuram Thombare <pthombar@cadence.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boris Brezillon <bbrezillon@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Conor Culhane <conor.culhane@silvaco.com>, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_183424_370964_A2E8F4CF 
X-CRM114-Status: GOOD (  19.73  )
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

T24gVHVlLCBBdWcgMjAsIDIwMjQgYXQgMTI6MDLigK9BTSBGcmFuayBMaSA8RnJhbmsuTGlAbnhw
LmNvbT4gd3JvdGU6Cj4KPiBXaGVuIGEgbmV3IGRldmljZSBob3Rqb2lucywgYSBuZXcgZHluYW1p
YyBhZGRyZXNzIGlzIGFzc2lnbmVkLgo+IGkzY19tYXN0ZXJfYWRkX2kzY19kZXZfbG9ja2VkKCkg
aWRlbnRpZmllcyB0aGF0IHRoZSBkZXZpY2Ugd2FzIHByZXZpb3VzbHkKPiBhdHRhY2hlZCB0byB0
aGUgYnVzIGFuZCBsb2NhdGVzIHRoZSBvbGRkZXYuCj4KPiBpM2NfbWFzdGVyX2FkZF9pM2NfZGV2
X2xvY2tlZCgpCj4gewo+ICAgICAuLi4KPiAgICAgb2xkZGV2ID0gaTNjX21hc3Rlcl9zZWFyY2hf
aTNjX2Rldl9kdXBsaWNhdGUobmV3ZGV2KTsKPiAgICAgLi4uCj4gICAgIGlmIChvbGRkZXYpIHsK
PiAgICAgICAgIC4uLgo+ICAgICAgICAgaTNjX2Rldl9kaXNhYmxlX2liaV9sb2NrZWQob2xkZGV2
KTsKPiAgICAgICAgIF5eXl5eXgo+ICAgICAgICAgVGhlIG9sZGRldiBzaG91bGQgbm90IHJlY2Vp
dmUgYW55IGNvbW1hbmRzIG9uIHRoZSBpM2MgYnVzIGFzIGl0Cj4gICAgICAgICBkb2VzIG5vdCBl
eGlzdCBhbmQgaGFzIGJlZW4gYXNzaWduZWQgYSBuZXcgYWRkcmVzcy4gVGhpcyB3aWxsCj4gICAg
ICAgICByZXN1bHQgaW4gTkFDSyBvciB0aW1lb3V0LiBTbyByZW1vdmUgaXQuCj4gICAgIH0KPiB9
Cj4KPiBGaXhlczogMzE3YmFjZjk2MGE0ICgiaTNjOiBtYXN0ZXI6IGFkZCBlbmFibGUoZGlzYWJs
ZSkgaG90IGpvaW4gaW4gc3lzIGVudHJ5IikKPiBTaWduZWQtb2ZmLWJ5OiBGcmFuayBMaSA8RnJh
bmsuTGlAbnhwLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9pM2MvbWFzdGVyLmMgfCA0ICstLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiBpbmRl
eCA3MDI4ZjAzYzJjNDJlLi44NTJiMzIxNzhiNzIyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNj
L21hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiBAQCAtMjAzOSwxMCArMjAz
OSw4IEBAIGludCBpM2NfbWFzdGVyX2FkZF9pM2NfZGV2X2xvY2tlZChzdHJ1Y3QgaTNjX21hc3Rl
cl9jb250cm9sbGVyICptYXN0ZXIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgaWJpcmVxLm1h
eF9wYXlsb2FkX2xlbiA9IG9sZGRldi0+aWJpLT5tYXhfcGF5bG9hZF9sZW47Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgaWJpcmVxLm51bV9zbG90cyA9IG9sZGRldi0+aWJpLT5udW1fc2xvdHM7
Cj4KPiAtICAgICAgICAgICAgICAgICAgICAgICBpZiAob2xkZGV2LT5pYmktPmVuYWJsZWQpIHsK
PiArICAgICAgICAgICAgICAgICAgICAgICBpZiAob2xkZGV2LT5pYmktPmVuYWJsZWQpCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbmFibGVfaWJpID0gdHJ1ZTsKPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGkzY19kZXZfZGlzYWJsZV9pYmlfbG9ja2VkKG9sZGRl
dik7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgfQo+Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgaTNjX2Rldl9mcmVlX2liaV9sb2NrZWQob2xkZGV2KTsKCmkzY19kZXZfZnJlZV9pYmlfbG9j
a2VkIHdpbGwgc3RpbGwgZW5jb3VudGVyIFdBUk5fT04oZGV2LT5pYmktPmVuYWJsZWQpLgoKVGhh
bmtzLApTdGFubGV5Cgo+ICAgICAgICAgICAgICAgICB9Cj4KPiAtLQo+IDIuMzQuMQo+Cj4KPiAt
LQo+IGxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKPiBsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNj
CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
