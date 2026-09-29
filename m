Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE11CA5FA1
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Sep 2026 06:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iD+ALHmmkRe450TmDsgZD+NcspDe5B2nMp8CU7wNziU=; b=y3i7sti91b2AJE
	YbFMuB8EtMSGS9h77tdBa05IS10dLlBALDZ2VW2+hfhiZCzIcSmu6W/m1oXcLboh9LMSf35C3qZW1
	MdSRNayr92JxFSTK7kA3bqnhGZ4LjsHXEHtNUtqlzTfBbsXVdnWq6bE4wuHPq7R8ee6vZw1Kb9GXB
	JTxR4H3G/zdN9nJQBdCeuv2HVT6Jt4KVtiZv4D9R10nFkULsUSv9Xq9uhA5A45M/JvhtURt0BBajL
	HU8LFyO3xVKFdWdR/6qe+GrWc+7MtnhEvV2E7cxvsj4lzPbsTa5BUyVGXjjbCJvRWivc/9XXD0hX6
	Ewwjk3TOA7yinOZSyafw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRaU-00000002WKp-2Ic0;
	Tue, 29 Sep 2026 06:45:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRaT-00000002WKj-2WXR
	for linux-i3c@lists.infradead.org;
	Tue, 29 Sep 2026 06:45:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B9AF1431CC;
	Tue, 29 Sep 2026 06:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DAB71F000FF;
	Tue, 29 Sep 2026 06:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790664311;
	bh=G5zFNDaRofYyEO7QPnbdPTFANbG/gza9yvu5YfV+A3U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gy5Ukg4QZDE/ottoyJECO60FQnDIcUc7/FvaGYlG19Av4npkxrTfyKn6Z8jyici47
	 Z57SQfaEs7vYkvNqD6hTEB0say8DDhmTj01movMTSHbzRvhSUHLfAQ3bl7QBAKVVuV
	 9hr/PaDL4n3EwK/d1GXHVXVvshfYodXx8MLtw0PVd43qhBV38N5xVxQk835qOdT7k8
	 sGzKh21T+jZbSR6csgJLT/E5LQafAzHT+qO2B1hRVu7sG78GqInmnauxkbgRNqyfzF
	 rz7PlsnVoKd+QosUwgvOFmh6I/ofCz2vV9w9y5xd6dns+6Ish5rrMSORPfqMUz2GzM
	 KZSL6rw5IwQBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/20] i3c: dw: switch to array-based exclusive reset
 control
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-i3c@lists.infradead.org, mfd@lists.linux.dev, lee@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, devicetree@vger.kernel.org, linux-serial@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260929061417.20733-6-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-6-jszhang@kernel.org>
Date: Tue, 29 Sep 2026 06:45:10 +0000
Message-Id: <20260929064511.0DAB71F000FF@smtp.kernel.org>
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

PiBUaGUgU3lub3BzeXMgRGVzaWduV2FyZSBJM0MgbWFzdGVyIGNvbnRyb2xsZXIgY2FuIGhhdmUg
bXVsdGlwbGUgcmVzZXQKPiBsaW5lcywgc3VjaCBhcyBhIGNvcmUgcmVzZXQgYW5kIEFQQiByZXNl
dC4KPiAKPiBSZWZhY3RvciB0aGUgZHJpdmVyIHRvIHVzZSBkZXZtX3Jlc2V0X2NvbnRyb2xfYXJy
YXlfZ2V0X2V4Y2x1c2l2ZSgpCj4gaW5zdGVhZCBvZiBhIHNpbmdsZSBuYW1lZCByZXNldCBoYW5k
bGUuIFRoaXMgYXV0b21hdGljYWxseSBtYW5hZ2VzIGFsbAo+IHJlc2V0cyBhbGxvY2F0ZWQgdG8g
dGhlIGRldmljZSBub2RlIHNlcXVlbnRpYWxseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKaXNoZW5n
IFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+CgpTYXNoaWtvIGhhcyByZXZpZXdlZCB0aGlzIHBh
dGNoIGFuZCBmb3VuZCBubyBpc3N1ZXMuIEl0IGxvb2tzIGdyZWF0IQoKLS0gClNhc2hpa28gQUkg
cmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkyOTA2MTQxNy4y
MDczMy0xLWpzemhhbmdAa2VybmVsLm9yZz9wYXJ0PTUKCgotLSAKbGludXgtaTNjIG1haWxpbmcg
bGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
