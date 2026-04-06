Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAE1EF4EAE
	for <linux-i3c@archiver.kernel.org>; Mon,  6 Apr 2026 06:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UdEnRzENZTPXDYv+MTxKWq9itm1PpyqZgyZPBB0jxBY=; b=elxflE/16k7TCe
	UekTSQuDgsoLH1zGPKbtEZzVcxHjYsQoYfd01G+/y8+cJ/5ZLwiKgTu9BmuA8rVU3UFcw5/FS6Yfd
	kkFSM3HWcCAxuKQFDQuH5HsHTTmWhxqfttZe9XjyipJV9pg86VuAgGDIjgVeleOyg4l9mqPU9PfcP
	FtNIb2Ng8IF5jZ7skNiUP5lhQUNLFHbcqVI6O7GP9sw5eOY7aZTwdjFZec9kb8J3EoQAJuf7tBYNl
	VtKFHL/5KSa/M9hXFf2A/3+/edXrhQT7GisvDIaW6SP/ppsOZJ0WlxJFbPGus/B54IXnu45gvmvL9
	rUR9tHfR+IIZKVOJstyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9dou-00000004rtd-3lW4;
	Mon, 06 Apr 2026 06:52:24 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9dos-00000004rtJ-1jST
	for linux-i3c@lists.infradead.org;
	Mon, 06 Apr 2026 06:52:23 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2b25cf1b5f0so22552195ad.3
        for <linux-i3c@lists.infradead.org>; Sun, 05 Apr 2026 23:52:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775458341; cv=none;
        d=google.com; s=arc-20240605;
        b=VBh9bVuwkO9dTxJjqVRCxddiIHRcf4qVY1bRfSYfbnKlu1yMfWmzDU8fl2gHXxfICC
         cyo/2sBCSRY3GhCD0hyLL8nmMNqBgUuV0D3tjB4kdzZ+8uSj4pLvEf7fXdu8gNTBo7Q3
         xNL8GQi14NScwA3erOObI7NEi6/jjuAyO8ee4qxMC0TMj60WspEHf7RHcfsFlPLW7XnP
         vHFrQz1RVWRN0d7jsytPRMaP2Cem4VysDuEdquNQr1Qb7MgivmBDvP5DhWAQ/944vF/h
         3NMBOhl4U+JpL8SLbhtbz37QiWzCfuLViT05iKLHBZzj6DVJzAA2U+00YE7FFIdAEs7M
         peeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dOHFdjMgn0tlpNSZ65+Jd2ij6X/dY0AeNmJZm09jjKQ=;
        fh=V3LC+ys9ZWURRBsewBwuvA9djaqNqzpItpEgRYSMFXE=;
        b=ZS8pDQysgvfAPQNg+gD8B6fp24jIX+luUgi7/6PF5gfNbyBW0GprqnUUb2hi5tdcqd
         4kq9GBRckpREUt6f0+73BTvTxwG/LeAizeM82jsF8yD4H7WpSu4DbP8mapeXLkQoA7G+
         yBhgQGxxr65M4fFeH4lEn9eo3I/YMTgND4FjIjUGXPEkjNDVRz2kR2GTywpFa87ErleG
         gsb9Rbva+zj0nCZYCINhNMfB0Dk7XpyRNMdkYLlereo/sNFjg39jD9D92Jva+AdQupKA
         IVagB9fGxDHbhV/WGSKjT3dblItJWzjAYss3knXKBTCzhjIYxF55E08VNUXNxY4Rc2qc
         TUcA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775458341; x=1776063141; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOHFdjMgn0tlpNSZ65+Jd2ij6X/dY0AeNmJZm09jjKQ=;
        b=YY0b/WSrtXAGS95sr0J+ryIYu9QyQbeuhp38sJPZsLCqLHpPoEMstrdO5sBspryE8A
         PwPMw7bV8GMvORyNl/1IdWG2Pjg3ZUgm5Y+DzWVOY8Az7RL/IK8gUWAKcDb1Vuat7CGx
         Xg1yHwF9D7Q14DdoXFihAEs8ZlNYJRZmSQFZRpwxnAtPz3BAccj4M75NH/8rK7FCM1Go
         jD7TvGutOIOVK43RMwkbPGaUELbUQSBCI/xuXVUON5iP8bdcdCEIzw/3RVsngJRxvf2N
         05a3fvKav0mzvfQIq3beCr8LHh7uYSp2XJBAu+ATamai0bzk4jgVQS6rD9Gesm0MSLzW
         FMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775458341; x=1776063141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dOHFdjMgn0tlpNSZ65+Jd2ij6X/dY0AeNmJZm09jjKQ=;
        b=UhK1d3UXM6P9JqtPmcPX8ED8GWUxZ6dDuwSZl70ujULXAMd0PrF13h5yhV/2Ox2SGV
         mdMtKzS4mwLviisAnt4qKRdjmGPqSuJC7VLOx6/KLIvVziqWgCWM4SbCqE75l4ajMMLK
         QTVongqu7WWXyDgk9EpAOvxcK3pHXVwsyTndHRgXDJEQaI8tpH7Bco7cjkgrlgZmsmMx
         m8/GIgGlKlaGei1CjfSwtOU5ideTGT1MWXxXMBwkU2zp0E7sg+kXxVAANS9qWVhwRlmk
         9//mkuialqzcVRbRXZOAfYZ6WSw6PtKAO/ZSs8nIK7vdHOBOvinvUHSHPvw4q30rSfIv
         2eDg==
X-Forwarded-Encrypted: i=1; AJvYcCUm2cP/BD7b47Rj8EUfhOTZtasjKtjzSmEYuWdk/GdXOVoGSOQCToM/tpa4fH+tuhiNLZRLYVuVQ28=@lists.infradead.org
X-Gm-Message-State: AOJu0YxPBds1YLW6wnyxRNp6ox3i7vnYNbAp07laOCyfSGdAqSuctM1F
	dgDXo20+LgkZuNbhcXO9E6W1JuVaKbLn5znCPxnM52p86dXxweI4vibM3ytphdkLN6U8dfBcCzy
	gYAAjsnAjuhMhm0l4xwOg/qjm+uEbJ5dR1+Bk
X-Gm-Gg: AeBDieso4hxL5rqp3WLBGV3/ahZ/3d016CAoGouGqrNrow0RG//D0v87+zCJiAVcIv6
	zYr9/DHgq/LsrgWnhSooMaBPnDcMZhR31m79yTCI4hhoCb+ZL+TgHkW7QUV4J13v+dumgoyCSR+
	HSz1W+tkTH99YQ3Lyz1/LkzaNDTs/1liTU/GYjApOFo4KsRJ5fLcZ60stCy6dJGb1zEHNkUZ28S
	rxOO0EfgloRTms4tPSQMnrjECulL5tkzzaRSrNO1bXZeimv76O2g9af/Rqp+Q4h2Axqk453ZKwF
	Ozdwl/Bqs4QqiiViM0NLqyKL1VNfIyH70S8hYh/qkVISYLM5Tl9Wv73sy5jWCEPwpTGgHMulHcu
	UEbRiKNwh6TustEl/9Km2TQ==
X-Received: by 2002:a17:903:1ae3:b0:2b0:afad:7aad with SMTP id
 d9443c01a7336-2b2818016c3mr121001825ad.45.1775458340699; Sun, 05 Apr 2026
 23:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260404-dw-i3c-2-v3-0-8f7d146549c1@gmail.com>
 <20260404-dw-i3c-2-v3-1-8f7d146549c1@gmail.com> <adMjD5qrfXjtioDJ@lizhi-Precision-Tower-5810>
In-Reply-To: <adMjD5qrfXjtioDJ@lizhi-Precision-Tower-5810>
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 6 Apr 2026 14:52:09 +0800
X-Gm-Features: AQROBzA-0vKPtIMZ7LO-Y2cxIKDNINgmizRhjhPS9E9Y35d4bMmHhlmZ4_zzsCc
Message-ID: <CAN4SLj3+4+hhz_O-6tH6dug2UUxYowm7nnFb7YXe4iuWcAaMQQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] i3c: dw: Fix memory leak in dw_i3c_master_i3c_xfers()
To: Frank Li <Frank.li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Aniket <aniketmaurya@google.com>, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_235222_483061_3BD1D419 
X-CRM114-Status: UNSURE (   6.77  )
X-CRM114-Notice: Please train this message.
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

T24gTW9uLCBBcHIgNiwgMjAyNiBhdCAxMTowNeKAr0FNIEZyYW5rIExpIDxGcmFuay5saUBueHAu
Y29tPiB3cm90ZToKPgo+Cj4gWW91IG1pc3NzZWQgVG9tbWFzbyBNZXJjaWFpIHJldmlldyB0YWdz
IGluIHYyCj4KPiBGcmFuawpIaSBGcmFuaywKWW91IG1peGVkIHVwIHRoZSByZXZpZXcsIFRvbW1h
c28gTWVyY2lhaSByZXZpZXcgdGFncyBpcyBmb3IgYW5vdGhlciByZXZpZXcuCmh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xrbWwvYWM5MjJVYTNVamJaWGRQVkB0b20tZGVza3RvcC8KCkJlc3QgUmVn
YXJkcywKRmVsaXggR3UKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtaTNjCg==
