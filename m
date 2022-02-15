Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8483BC433F5
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Mar 2022 16:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vf7rKt9UL+kDBL2y7VGBRb2oJV2VXUcKhHDy7JRHNNw=; b=uUrbAc4bmqDJDU
	egGdQOjYs/eoYymJnyEHWi+u0SqYb21JyOOFL3CyNaD/s1w2Lh1xQClSKF4uGsHk+hCAXitD1ik46
	j9clfx5TzW12kiC06InjxHRQ3Sn3fH8spzTfbyHL1RcYFz7mYAbI/sVaVsnHUQ7m27chMteQ/BPvS
	qyr6GoW0VcRHFifMLQ2dg/AlCraQ1C98YG+LRR3t7G250WMqbF6huRga4oTO4K73bdPk/RyLrNkgv
	Ne2GnIFf62EQ1P89l9eoBg3faKzLwclMWzSNQrvDz6S6ymCPOe72VECRK5N6divNKXn+jKntXGaJa
	CFQ13tHRWIrt5uWAlLgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRzPK-009Wvh-29; Wed, 09 Mar 2022 16:43:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK3MT-004HCC-GH; Tue, 15 Feb 2022 19:19:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3A349617A1;
 Tue, 15 Feb 2022 19:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E76B9C340EB;
 Tue, 15 Feb 2022 19:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644952780;
 bh=RxAYLCqbUWlxjV9GFahzPwnkRBYKU9aVJMxo+INb+K8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oa82FKq0/HZo1Hieccox0xhuEOltsBpyNCb/oKWHfz9JimsfI5qrPFHosVG+Hw9KD
 FqjMZvJ5BquXlsEM1IUTOugfyhHJjbL+NoooCvHgJp/wzFU4N6mJ3/+qfEy0h1bhbj
 fv9Bo5w4LHHM1g+pM9OlS1+FV6MX0/N+Aa88X5OzELy65s1Xs5Q/258d9WBNoUp0fb
 HMGG+vm/A6PvbbvtXJ00MB45hauRqyRZCekvmCmXYRktZmaEtd9qOIjTryp50cyo1/
 0DT+ajNam/uql+1lfstz9xW/6FSdwogqLIyHb8bwuPl3b0gveaOfCnpwJkPBK0mL1q
 tCTR2Et3rHU/g==
Date: Tue, 15 Feb 2022 21:19:29 +0200
From: Leon Romanovsky <leon@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
 GR-QLogic-Storage-Upstream@marvell.com, linux-alpha@vger.kernel.org,
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
Message-ID: <Ygv8wY75hNqS7zO6@unreal>
References: <20220215174743.GA878920@embeddedor>
 <202202151016.C0471D6E@keescook>
 <20220215192110.GA883653@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220215192110.GA883653@embeddedor>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_111941_684363_FAFC8F91 
X-CRM114-Status: GOOD (  21.11  )
X-Mailman-Approved-At: Wed, 09 Mar 2022 08:32:06 -0800
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

T24gVHVlLCBGZWIgMTUsIDIwMjIgYXQgMDE6MjE6MTBQTSAtMDYwMCwgR3VzdGF2byBBLiBSLiBT
aWx2YSB3cm90ZToKPiBPbiBUdWUsIEZlYiAxNSwgMjAyMiBhdCAxMDoxNzo0MEFNIC0wODAwLCBL
ZWVzIENvb2sgd3JvdGU6Cj4gPiBPbiBUdWUsIEZlYiAxNSwgMjAyMiBhdCAxMTo0Nzo0M0FNIC0w
NjAwLCBHdXN0YXZvIEEuIFIuIFNpbHZhIHdyb3RlOgo+ID4gPiBUaGVyZSBpcyBhIHJlZ3VsYXIg
bmVlZCBpbiB0aGUga2VybmVsIHRvIHByb3ZpZGUgYSB3YXkgdG8gZGVjbGFyZQo+ID4gPiBoYXZp
bmcgYSBkeW5hbWljYWxseSBzaXplZCBzZXQgb2YgdHJhaWxpbmcgZWxlbWVudHMgaW4gYSBzdHJ1
Y3R1cmUuCj4gPiA+IEtlcm5lbCBjb2RlIHNob3VsZCBhbHdheXMgdXNlIOKAnGZsZXhpYmxlIGFy
cmF5IG1lbWJlcnPigJ1bMV0gZm9yIHRoZXNlCj4gPiA+IGNhc2VzLiBUaGUgb2xkZXIgc3R5bGUg
b2Ygb25lLWVsZW1lbnQgb3IgemVyby1sZW5ndGggYXJyYXlzIHNob3VsZAo+ID4gPiBubyBsb25n
ZXIgYmUgdXNlZFsyXS4KPiA+ID4gCj4gPiA+IFRoaXMgY29kZSB3YXMgdHJhbnNmb3JtZWQgd2l0
aCB0aGUgaGVscCBvZiBDb2NjaW5lbGxlOgo+ID4gPiAobmV4dC0yMDIyMDIxNCQgc3BhdGNoIC0t
am9icyAkKGdldGNvbmYgX05QUk9DRVNTT1JTX09OTE4pIC0tc3AtZmlsZSBzY3JpcHQuY29jY2kg
LS1pbmNsdWRlLWhlYWRlcnMgLS1kaXIgLiA+IG91dHB1dC5wYXRjaCkKPiA+ID4gCj4gPiA+IEBA
Cj4gPiA+IGlkZW50aWZpZXIgUywgbWVtYmVyLCBhcnJheTsKPiA+ID4gdHlwZSBUMSwgVDI7Cj4g
PiA+IEBACj4gPiA+IAo+ID4gPiBzdHJ1Y3QgUyB7Cj4gPiA+ICAgLi4uCj4gPiA+ICAgVDEgbWVt
YmVyOwo+ID4gPiAgIFQyIGFycmF5Wwo+ID4gPiAtIDAKPiA+ID4gICBdOwo+ID4gPiB9Owo+ID4g
Cj4gPiBUaGVzZSBhbGwgbG9vayB0cml2aWFsbHkgY29ycmVjdCB0byBtZS4gT25seSB0d28gZGlk
bid0IGhhdmUgdGhlIGVuZCBvZgo+ID4gdGhlIHN0cnVjdCB2aXNpYmxlIGluIHRoZSBwYXRjaCwg
YW5kIGNoZWNraW5nIHRob3NlIHNob3dlZCB0aGVtIHRvIGJlCj4gPiB0cmFpbGluZyBtZW1iZXJz
IGFzIHdlbGwsIHNvOgo+ID4gCj4gPiBSZXZpZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0Bj
aHJvbWl1bS5vcmc+Cj4gCj4gSSdsbCBhZGQgdGhpcyB0byBteSAtbmV4dCB0cmVlLgoKSSB3b3Vs
ZCBsaWtlIHRvIGFzayB5b3UgdG8gc2VuZCBtbHg1IHBhdGNoIHNlcGFyYXRlbHkgdG8gbmV0ZGV2
LiBXZSBhcmUgd29ya2luZwp0byBkZWxldGUgdGhhdCBmaWxlIGNvbXBsZXRlbHkgYW5kIHByZWZl
ciB0byBhdm9pZCBmcm9tIHVubmVjZXNzYXJ5IG1lcmdlIGNvbmZsaWN0cy4KClRoYW5rcwoKPiAK
PiBUaGFua3MhCj4gLS0KPiBHdXN0YXZvCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51
eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
