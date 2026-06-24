Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC11CDB47C
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Jun 2026 10:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hsTD6JC6sZlmrX7y2c3F/iT4mbvmqx+YaNZw+1JWTF8=; b=b1xylIDF73bZFR
	mEWW42lwZHovbuVWlfy1je1f89w7P85aVG4neJ+xzxGDn4L7kzsd+u31VyG3bz+Qujn5FLcBhN3gw
	+DeOLgDSQQhXvLXnvQNjYHUMZygrLBQUJL/CrxU3obxEIePkk5V7F0Ps/FFzO+njNXYKhxIIsxutb
	F8J+2mERxIA68wAfgXu+uOaAaFiYaEN15c7OAWgx+WXhblJfDW9WBsQCAU+wkpO6BYuf/8GJ27tro
	E6CeEKWrX1QOOhwx7/Am/T7nYNqbwntuqWJnyv/9n0WrbBW0MV4EW9hQ6ezrdCqCAD87rcisgHOyW
	RGOz3xCAvDMb240B65QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKsn-00000007c2T-3XrW;
	Wed, 24 Jun 2026 10:31:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKsm-00000007c2L-1dAk
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jun 2026 10:31:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7336260138;
	Wed, 24 Jun 2026 10:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1D5A1F000E9;
	Wed, 24 Jun 2026 10:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782297059;
	bh=hRrlj0h4QIwC5fB0RzRJQAmIzTt6+MQSSHJszlDVf1k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ds6cQic83sgJmRIKt9cF77SIU4gI2+SwNga0ZZjtQ6gFYppCly4CgmxPdU4l7dyBC
	 VEKE2b5a1f7gDjeWB9f6P3Q3rqc0kJGaw3wn80/2UZYQ91ULv3TbiqsNHo6HdY84fR
	 qv6JzyH9/W7oIsP2JSWDHH9+7h9BCjFrK64pOqwhPHk8a3vq8Iseq3onb/qPBiGCYl
	 I0a1VheaYFwyfjzwq6BfaIlmcH3jwNtZKD3UxqYg58Ga5cC9/E2MXa7IUPWjZ9RlGF
	 VfJsrc5k7MWEfcvUoP9IIYl/5oRCQ9s727tMpyhcWppkueMFS1H4XiHVkCDmcFakWE
	 t65TgoAL2pY7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 01/12] dt-bindings: i3c: Add mipi-i3c-static-method
 to support SETAASA
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260624102153.1770072-2-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
 <20260624102153.1770072-2-akhilrajeev@nvidia.com>
Date: Wed, 24 Jun 2026 10:30:58 +0000
Message-Id: <20260624103058.D1D5A1F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

PiBBZGQgdGhlICdtaXBpLWkzYy1zdGF0aWMtbWV0aG9kJyBwcm9wZXJ0eSBtZW50aW9uZWQgaW4g
dGhlIE1JUEkgSTNDCj4gRGlzY292ZXJ5IGFuZCBDb25maWd1cmF0aW9uIFNwZWNpZmljYXRpb24g
WzFdIHRvIHNwZWNpZnkgd2hpY2ggZGlzY292ZXJ5Cj4gbWV0aG9kIGFuIEkzQyBkZXZpY2Ugc3Vw
cG9ydHMgZHVyaW5nIGJ1cyBpbml0aWFsaXphdGlvbi4gVGhlIHByb3BlcnR5IGlzCj4gYSBiaXRt
YXAsIHdoZXJlIGEgYml0IHZhbHVlIG9mIDEgaW5kaWNhdGVzIHN1cHBvcnQgZm9yIHRoYXQgbWV0
aG9kLCBhbmQgMAo+IGluZGljYXRlcyBsYWNrIG9mIHN1cHBvcnQuCj4gCj4gQml0IDA6IFNFVERB
U0EgQ0NDIChEaXJlY3QpCj4gQml0IDE6IFNFVEFBU0EgQ0NDIChCcm9hZGNhc3QpCj4gQml0IDI6
IE90aGVyIENDQyAodmVuZG9yIC8gc3RhbmRhcmRzIGV4dGVuc2lvbikKPiBBbGwgb3RoZXIgYml0
cyBhcmUgcmVzZXJ2ZWQuCj4gCj4gSXQgaXMgc3BlY2lmaWNhbGx5IG5lZWRlZCB3aGVuIGFuIEkz
QyBkZXZpY2UgcmVxdWlyZXMgU0VUQUFTQSBmb3IgdGhlCj4gYWRkcmVzcyBhc3NpZ25tZW50LiBT
RVREQVNBIHdpbGwgYmUgc3VwcG9ydGVkIGJ5IGRlZmF1bHQgaWYgdGhpcyBwcm9wZXJ0eQo+IGlz
IGFic2VudCwgd2hpY2ggbWVhbnMgZm9yIG5vdyB0aGUgcHJvcGVydHkganVzdCBzZXJ2ZXMgYXMg
YSBmbGFnIHRvCj4gZW5hYmxlIFNFVEFBU0EsIGJ1dCBrZWVwIHRoZSBwcm9wZXJ0eSBhcyBhIGJp
dG1hcCB0byBhbGlnbiB3aXRoIHRoZQo+IHNwZWNpZmljYXRpb25zLgo+IAo+IFsxXSBodHRwczov
L3d3dy5taXBpLm9yZy9taXBpLWRpc2NvLWZvci1pM2MtZG93bmxvYWQKPiAKPiBSZXZpZXdlZC1i
eTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQWtoaWwgUiA8
YWtoaWxyYWplZXZAbnZpZGlhLmNvbT4KClNhc2hpa28gaGFzIHJldmlld2VkIHRoaXMgcGF0Y2gg
YW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgotLSAKU2FzaGlrbyBBSSByZXZp
ZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNjI0MTAyMTUzLjE3NzAw
NzItMS1ha2hpbHJhamVldkBudmlkaWEuY29tP3BhcnQ9MQoKCi0tIApsaW51eC1pM2MgbWFpbGlu
ZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
