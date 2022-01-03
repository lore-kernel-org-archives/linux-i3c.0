Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B52FC433F5
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Jan 2022 16:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ytUjVr72NumNHRxg//HLkxPiaSSCuWiIUQL80A0YX40=; b=ZvqOAzFfYEIGy1
	jsauNGazZQkzOwhQZ3sENqLHV54LLaDYuT8bTpItr480lM2coEJzPNsOKh0s/VOzkHkVZPj+OAIzM
	2VlSF2UUI+dHrjRKaNLeMH74RukIvhXVcZzxiX7reSpMJyqISC4moMxZyl9uBYgWPZUZgEmfi0MJR
	wjrZD+CJs0jyO1OjAe8bsdpT2aBvbwIfA5ddSJXpA/olpjgdZrisgE19r+DTLeaY7t/hhK+IGLVw4
	bdF+crrlUl3E8i+ugqp8mtmzYVcrJeTjlLWbBbxfJuzFUpstlnQgrDmfT96A56gGIDugE1r5RIlgm
	iEUmFBYUjcA3HLNmuFcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4Pty-009R55-BV; Mon, 03 Jan 2022 16:09:38 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4Ptw-009R4n-9h
 for linux-i3c@lists.infradead.org; Mon, 03 Jan 2022 16:09:37 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 03B8460009;
 Mon,  3 Jan 2022 16:09:29 +0000 (UTC)
Date: Mon, 3 Jan 2022 17:09:28 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Clark Wang <xiaoning.wang@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V5 4/8] i3c: master: svc: add support for slave to stop
 returning data
Message-ID: <20220103170928.76b2369f@xps13>
In-Reply-To: <20211227074529.1660398-5-xiaoning.wang@nxp.com>
References: <20211227074529.1660398-1-xiaoning.wang@nxp.com>
 <20211227074529.1660398-5-xiaoning.wang@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_080936_498394_EF049433 
X-CRM114-Status: UNSURE (   7.35  )
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

SGkgQ2xhcmssCgp4aWFvbmluZy53YW5nQG54cC5jb20gd3JvdGUgb24gTW9uLCAyNyBEZWMgMjAy
MSAxNTo0NToyNSArMDgwMDoKCj4gV2hlbiBpM2MgY29udHJvbGxlciByZWFkcyBkYXRhIGZyb20g
c2xhdmUgZGV2aWNlLCBzbGF2ZSBkZXZpY2UgY2FuIHN0b3AKPiByZXR1cm5pbmcgZGF0YSB3aXRo
IGFuIEFDSyBhZnRlciBhbnkgYnl0ZS4KPiBBZGQgdGhpcyBzdXBwb3J0IGZvciBzdmMgaTNjIGNv
bnRyb2xsZXIuIE90aGVyd2lzZSwgaXQgd2lsbCB0aW1lb3V0Cj4gd2hlbiB0aGUgc2xhdmUgZGV2
aWNlIGVuZHMgdGhlIHJlYWQgb3BlcmF0aW9uIGVhcmx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENs
YXJrIFdhbmcgPHhpYW9uaW5nLndhbmdAbnhwLmNvbT4KPiBSZXZpZXdlZC1ieTogSnVuIExpIDxq
dW4ubGlAbnhwLmNvbT4KCkxvb2tzIGdvb2QgdG8gbWUgOikKClJldmlld2VkLWJ5OiBNaXF1ZWwg
UmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKQ2hlZXJzLApNaXF1w6hsCgotLSAK
bGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
