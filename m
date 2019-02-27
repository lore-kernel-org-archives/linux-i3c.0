Return-Path: <SRS0=zb1T=RC=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C17E1C43381
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Feb 2019 10:33:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CBE520830
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Feb 2019 10:33:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U5Dgp+gG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QVkXwNiB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CBE520830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EdgXneIN8QThKpZuq+nMsSd85BvIPXKWsubsfJtZbdg=; b=U5Dgp+gGnmVNPT
	S3SiFEEzprggpxbJZhjJQlriXIqlXrodg0cKzEeXUASALuq372O5NManVtC9VwnoJfE4FVpWkeB8b
	VrV3EUPihM2DfYmUl3LmBdpq8CRbvLHiJOLGuvo73asy9toPWk/Xd7wECUf5zAXECgYd4KgC9xFVM
	MDy6i3YNyvF3mGH3UF9aynWT1ZarxOY3XKXkqb3q7mSLAq0tGetfVGlIBSpTK3Efk0hWWlzhFTkRE
	dJaaeEjRSHNc5s7Z+Lh16Jl0kJVhmHGTG6yGAAiTOSQEw7HtoE7butU/xZHJHWvF5n3rKFuuK8DVw
	3lM6zOiFEnM2/nmCuX4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gywWf-0005Is-2O; Wed, 27 Feb 2019 10:33:21 +0000
Received: from smtprelay.synopsys.com ([198.182.60.111])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gywWc-0005H0-6r
 for linux-i3c@lists.infradead.org; Wed, 27 Feb 2019 10:33:19 +0000
Received: from mailhost.synopsys.com (dc2-mailhost1.synopsys.com
 [10.12.135.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id A68A210C10DA;
 Wed, 27 Feb 2019 02:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1551263594; bh=7fW13SS4AFOQkasAkFki8wa5dUGNFVXdIIMrd447xng=;
 h=Subject:To:CC:References:From:Date:In-Reply-To:From;
 b=QVkXwNiBUxlmy0R+63pJuU7S14UwwXlz1cWkH4Y/nLNqZAICIuCPAcVYfi7H0Dgyo
 68nHwCqGZ7m+nKvijnIQC+va1d8ghqQqFg6o9xUK+PKZIPUMRHsTcawR0Cp4UALbxD
 FgZPHrk2IYP2r1A9HR5y7WIDiIqlm0Yc212+jSxDpF9yDS+Irw96kHTGsqifTri2BL
 JhtoQKgkjG2P9Lv/lZ0LJ18QDQVdfaIKsjWD0cJpb82YHGeklnCfC0T1FW0pjhtfdk
 OIOIA62HZJabYLGWuENh0A2czZZum6cGV72bWMK8QElhDRBh3I44JZLX2xkOphpiTZ
 JfxkecjCj6sGg==
Received: from us01wehtc1.internal.synopsys.com
 (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 2AF33A0093;
 Wed, 27 Feb 2019 10:33:14 +0000 (UTC)
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 us01wehtc1.internal.synopsys.com (10.12.239.231) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 27 Feb 2019 02:33:14 -0800
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 DE02WEHTCA.internal.synopsys.com (10.225.19.92) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 27 Feb 2019 11:33:11 +0100
Received: from [10.0.2.15] (10.107.25.89) by DE02WEHTCB.internal.synopsys.com
 (10.225.19.80) with Microsoft SMTP Server (TLS) id 14.3.408.0;
 Wed, 27 Feb 2019 11:33:11 +0100
Subject: Re: [PATCH] i3c: master: dw-i3c-master: mark expected switch
 fall-through
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Vitor Soares <vitor.soares@synopsys.com>,
 Boris Brezillon <bbrezillon@kernel.org>
References: <20190211221413.GA21822@embeddedor>
 <87e0a8c9-82f6-3f41-bdb6-162a4c264132@embeddedor.com>
From: vitor <vitor.soares@synopsys.com>
Message-ID: <0edcc5fb-6b7b-65cf-227d-af510cabc29c@synopsys.com>
Date: Wed, 27 Feb 2019 10:33:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <87e0a8c9-82f6-3f41-bdb6-162a4c264132@embeddedor.com>
Content-Language: en-US
X-Originating-IP: [10.107.25.89]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190227_023318_259031_54E83EEA 
X-CRM114-Status: GOOD (  16.49  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGkgR3VzdGF2bywKClNvcnJ5IGZvciB0aGUgZGVsYXkuCgpPbiAyNy8wMi8xOSAwMzo1MywgR3Vz
dGF2byBBLiBSLiBTaWx2YSB3cm90ZToKPiBIaSBhbGwsCj4KPiBGcmllbmRseSBwaW5nOgo+Cj4g
V2hvIGNhbiBhY2sgb3IgcmV2aWV3IHRoaXMsIHBsZWFzZT8KPgo+IFRoYW5rcwo+IC0tCj4gR3Vz
dGF2bwo+Cj4gT24gMi8xMS8xOSA0OjE0IFBNLCBHdXN0YXZvIEEuIFIuIFNpbHZhIHdyb3RlOgo+
PiBJbiBwcmVwYXJhdGlvbiB0byBlbmFibGluZyAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoLCBtYXJr
IHN3aXRjaAo+PiBjYXNlcyB3aGVyZSB3ZSBhcmUgZXhwZWN0aW5nIHRvIGZhbGwgdGhyb3VnaC4K
Pj4KPj4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgZm9sbG93aW5nIHdhcm5pbmc6Cj4+Cj4+IGRyaXZl
cnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmM6IEluIGZ1bmN0aW9uIOKAmGR3X2kzY19tYXN0
ZXJfYnVzX2luaXTigJk6Cj4+IGRyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmM6NjAz
OjY6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heSBmYWxsIHRocm91Z2ggWy1XaW1wbGljaXQt
ZmFsbHRocm91Z2g9XQo+PiAgICBpZiAocmV0KQo+PiAgICAgICBeCj4+IGRyaXZlcnMvaTNjL21h
c3Rlci9kdy1pM2MtbWFzdGVyLmM6NjA1OjI6IG5vdGU6IGhlcmUKPj4gICBjYXNlIEkzQ19CVVNf
TU9ERV9QVVJFOgo+PiAgIF5+fn4KPj4KPj4gV2FybmluZyBsZXZlbCAzIHdhcyB1c2VkOiAtV2lt
cGxpY2l0LWZhbGx0aHJvdWdoPTMKPj4KPj4gVGhpcyBwYXRjaCBpcyBwYXJ0IG9mIHRoZSBvbmdv
aW5nIGVmZm9ydHMgdG8gZW5hYmxlCj4+IC1XaW1wbGljaXQtZmFsbHRocm91Z2guCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+
Cj4+IC0tLQo+PiAgZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYyB8IDEgKwo+PiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1t
YXN0ZXIuYwo+PiBpbmRleCBiYjAzMDc5ZmJhZGUuLjU5Mjc5MjI0ZTA3ZiAxMDA2NDQKPj4gLS0t
IGEvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYwo+PiArKysgYi9kcml2ZXJzL2kz
Yy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jCj4+IEBAIC02MDIsNiArNjAyLDcgQEAgc3RhdGljIGlu
dCBkd19pM2NfbWFzdGVyX2J1c19pbml0KHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm0p
Cj4+ICAJCXJldCA9IGR3X2kyY19jbGtfY2ZnKG1hc3Rlcik7Cj4+ICAJCWlmIChyZXQpCj4+ICAJ
CQlyZXR1cm4gcmV0Owo+PiArCQkvKiBmYWxsIHRocm91Z2ggKi8KPj4gIAljYXNlIEkzQ19CVVNf
TU9ERV9QVVJFOgo+PiAgCQlyZXQgPSBkd19pM2NfY2xrX2NmZyhtYXN0ZXIpOwo+PiAgCQlpZiAo
cmV0KQo+PgpBY2tlZC1ieTogVml0b3IgU29hcmVzIDx2aXRvci5zb2FyZXNAc3lub3BzeXMuY29t
PgoKQmVzdCByZWdhcmRzLApWaXRvciBTb2FyZXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1pM2MK
