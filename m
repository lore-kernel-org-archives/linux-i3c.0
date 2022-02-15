Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A9FC433EF
	for <linux-i3c@archiver.kernel.org>; Tue, 15 Feb 2022 18:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+FDGV/xQVIw/zKgFrGGnT0YrydOFDrNVvU2rAHqEtkI=; b=wvrw4rdpMg45lz
	S6vtujbow1dB3qsBhPmjc2tssIASkrN32kqT03Hi5+92ZX0IqwGOff6e/6V6tdlu/d8lffxbjzHjJ
	eARRKFOlaZRW7levZBcQRAVTKnh61I+JjHe8ur63tSHuE5G3ZTycMTMAGIs51LuLsNhviF6w/T8Ty
	Jt3w6gLpg/a/+2HIv169R4F/N08AHK7MLqh8j1KGzLwldddDdpGZV4D5ZLICVNOWUk+d9yBCf4IfP
	DgZlhTMVoIcP4qb7njUCK/iEo5O7NvwLBtrDhQAiogTlt5IF2+/xGEq4asenqtP6WMAqcGA5gjGmf
	ZEVx9EqDcC31Zhzqxgrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK2Ok-00439o-7F; Tue, 15 Feb 2022 18:17:58 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK2OW-00432S-Nk
 for linux-i3c@lists.infradead.org; Tue, 15 Feb 2022 18:17:46 +0000
Received: by mail-pj1-x102a.google.com with SMTP id y9so18079636pjf.1
 for <linux-i3c@lists.infradead.org>; Tue, 15 Feb 2022 10:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=rU/cr+2YS83r8ZzfG0ihHyfke5lY7dzNO33vRqwTRo0=;
 b=BbY3zUMbpsKVLuD6QiFaFpnxej58wpxQPVVGisDcf+K+2coTsFmZNXGoWqBeKoLb1x
 3ZptFg7el6LpqeSuHR1QjwuSCHfpkEX/T+XcjAHpaQzkvx2kHT7d0+kYGoaayuMfQhPV
 CAs5kcpK7DDzn/NDlTFukbq1xe316LjUYcWLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=rU/cr+2YS83r8ZzfG0ihHyfke5lY7dzNO33vRqwTRo0=;
 b=Ge3x83YXZos+mv+VDBFAnfOg3fw4x+weWzdoxN8aa1u+Hte0MpcpgpM0HS+xx5l3NK
 adrUxT4nZ5SP6Qrje9I0Uoc2JoRhtAYb3BVfjv2WeBCRgPKsA9gGUaZvUOTyIMdydM+D
 Pq8UmrkWwkyPiMQy5ey1V1mXLOkzBMJg/tsdrb40AjvCkAqTFQ0+uVQptpMVe4sYmOWj
 BWWM0DHffdjZLOK1VuHYFlXltuKlpyyDAmd1UPUxYI4+TLbJUAIHmLr1h1LWJhUD+RIE
 IocH4Uc23zSQA9ht66vod6Id0wtPX2tkR24S8xdlqrcn5brsxtcnn//d0JNvzqNjznZD
 anlA==
X-Gm-Message-State: AOAM533/wlY65KCwoy48T6QEBmMn/1BBK80QHYKvYdlbRAnwmFuxQsH4
 uA/6n1JAkzS9+xLJO1OkWG1oQw==
X-Google-Smtp-Source: ABdhPJwjJJkj0fC2gO+FdGjnaisWCk9FKkCf0qazg7PUuY4rrjoW+egyeLOWB+yCEr/MI5qa+9+dbA==
X-Received: by 2002:a17:902:eb8f:: with SMTP id
 q15mr235036plg.67.1644949062021; 
 Tue, 15 Feb 2022 10:17:42 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id a186sm3157627pgc.70.2022.02.15.10.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 10:17:41 -0800 (PST)
Date: Tue, 15 Feb 2022 10:17:40 -0800
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: GR-QLogic-Storage-Upstream@marvell.com, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, mpi3mr-linuxdrv.pdl@broadcom.com,
 linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
 sparmaintainer@unisys.com, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-ext4@vger.kernel.org,
 linux-acpi@vger.kernel.org, devel@acpica.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org,
 greybus-dev@lists.linaro.org, linux-i3c@lists.infradead.org,
 linux-rdma@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] treewide: Replace zero-length arrays with
 flexible-array members
Message-ID: <202202151016.C0471D6E@keescook>
References: <20220215174743.GA878920@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220215174743.GA878920@embeddedor>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_101744_816282_775ACF46 
X-CRM114-Status: GOOD (  12.71  )
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

T24gVHVlLCBGZWIgMTUsIDIwMjIgYXQgMTE6NDc6NDNBTSAtMDYwMCwgR3VzdGF2byBBLiBSLiBT
aWx2YSB3cm90ZToKPiBUaGVyZSBpcyBhIHJlZ3VsYXIgbmVlZCBpbiB0aGUga2VybmVsIHRvIHBy
b3ZpZGUgYSB3YXkgdG8gZGVjbGFyZQo+IGhhdmluZyBhIGR5bmFtaWNhbGx5IHNpemVkIHNldCBv
ZiB0cmFpbGluZyBlbGVtZW50cyBpbiBhIHN0cnVjdHVyZS4KPiBLZXJuZWwgY29kZSBzaG91bGQg
YWx3YXlzIHVzZSDigJxmbGV4aWJsZSBhcnJheSBtZW1iZXJz4oCdWzFdIGZvciB0aGVzZQo+IGNh
c2VzLiBUaGUgb2xkZXIgc3R5bGUgb2Ygb25lLWVsZW1lbnQgb3IgemVyby1sZW5ndGggYXJyYXlz
IHNob3VsZAo+IG5vIGxvbmdlciBiZSB1c2VkWzJdLgo+IAo+IFRoaXMgY29kZSB3YXMgdHJhbnNm
b3JtZWQgd2l0aCB0aGUgaGVscCBvZiBDb2NjaW5lbGxlOgo+IChuZXh0LTIwMjIwMjE0JCBzcGF0
Y2ggLS1qb2JzICQoZ2V0Y29uZiBfTlBST0NFU1NPUlNfT05MTikgLS1zcC1maWxlIHNjcmlwdC5j
b2NjaSAtLWluY2x1ZGUtaGVhZGVycyAtLWRpciAuID4gb3V0cHV0LnBhdGNoKQo+IAo+IEBACj4g
aWRlbnRpZmllciBTLCBtZW1iZXIsIGFycmF5Owo+IHR5cGUgVDEsIFQyOwo+IEBACj4gCj4gc3Ry
dWN0IFMgewo+ICAgLi4uCj4gICBUMSBtZW1iZXI7Cj4gICBUMiBhcnJheVsKPiAtIDAKPiAgIF07
Cj4gfTsKClRoZXNlIGFsbCBsb29rIHRyaXZpYWxseSBjb3JyZWN0IHRvIG1lLiBPbmx5IHR3byBk
aWRuJ3QgaGF2ZSB0aGUgZW5kIG9mCnRoZSBzdHJ1Y3QgdmlzaWJsZSBpbiB0aGUgcGF0Y2gsIGFu
ZCBjaGVja2luZyB0aG9zZSBzaG93ZWQgdGhlbSB0byBiZQp0cmFpbGluZyBtZW1iZXJzIGFzIHdl
bGwsIHNvOgoKUmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgoK
LS0gCktlZXMgQ29vawoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1pM2MK
