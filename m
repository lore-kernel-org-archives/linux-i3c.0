Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEDEC27C4F
	for <linux-i3c@archiver.kernel.org>; Wed, 26 Jun 2024 08:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=efAjZsHi4MWeWeWTMmA0WT/LQsdWOQS+SCCA/37N5sE=; b=bBL9m05G5W2mDx
	oLatNIQ82hfZbtpbVkda8a3TAlruYE+oQLQlLjSBcot60cW5y62QO2yKflvToIoY0SvM8ffYrZNLD
	V8Tsteu3m7AFIfHGC1mIWkFf+zucdKWigTqqoI17dMgbAOKU118ho2dRdevwPaGLzYbbHCUq1EpME
	VwElvys7XWwqp4pQvVOJpC08RLsUPxbRsUQG0mzucqFPw1Mz0/wG+9cfBIWKMWPxO4DGaXAlpN/fB
	VT1QspAEiHM9q3l/FYEYaLzzHcWmOkgGHk38sBZ/h7d1Lj6/XJulH8Rr+1SLuJNPCvixN17/2SGjJ
	T7nYupdw59uTvDaacmCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMNfg-00000005r0S-0FQY;
	Wed, 26 Jun 2024 08:06:28 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMNfc-00000005qzf-2HBR
	for linux-i3c@lists.infradead.org;
	Wed, 26 Jun 2024 08:06:26 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3629c517da9so6214548f8f.2
        for <linux-i3c@lists.infradead.org>; Wed, 26 Jun 2024 01:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719389181; x=1719993981; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=My9/g0GVPEXpaxxN/7a6H9LSpMIXap4+noEpDsopA0A=;
        b=AUoFE1KCjXe728KIUjylJf0HXNxj94Vy/WCMVhVkrQ1QHjSH244NU33A5Gi+jAwj6k
         O/RHKR1HnUosUeQDi5J1LuaZ8jJUw2G8sDBipy9col91EWg5jgo+8yRkzYRuGdpk4szu
         OCCPJ/ijP0aczF44OCw3YI5zwiU+AdALaFAeO6EfWiIKSXMc5vRtqYDSoc/lgNxrMVfc
         uR3qFXcs8p/fXUgk3p6KMigB8Tk/GXwf1kM3dJ0A8Hxvqu51IBF1tpayyQcP1yx20r4R
         BXSmAVUfyjLt8LGwIrY6Eqzgve4imL488EfsWft2Tv1SVnNRRcDDdCsie/yOu7akuWcy
         ACAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719389181; x=1719993981;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=My9/g0GVPEXpaxxN/7a6H9LSpMIXap4+noEpDsopA0A=;
        b=a5Zfdf62M4OxulhFIJQBAzk+wG3+sxoo0KVOx+E495w/up5ovXbk0AhbC9RH/G6BQV
         ahSDSKmM8GcV9y9x95iLN43Xe/+2COPalAgOU7OvxzXxNWVl/OM3U8oM8W+VMrClEGh1
         zEMzZR0RDzNqWc69Yghsb/5C06D+uwHq2Wqo81xrB84Oryh2xLm/LWLvpT8SKC2DR+yM
         tSSQOL9GK0h+z7J+v1Smf6nf3Mm8F73jI60NKXFmjm/4pWhBcQ3L83DCyXznp20MGimy
         lGQlOW59tuAdmox0wuKkZlDQdatCgbOS1Nucbkktczw5NA+JJThcmwCt9TlTeDWRYd8N
         tFFw==
X-Gm-Message-State: AOJu0YyTcqsxfm8RWqcAvTOQCMWkOf0IvSWAIc2JX3CF5svxjkQ5UtR2
	qKSpFbO7461ZHPqfLr7JT/0XLrVMqWPJJNoMdld69vQbcU7T02Iz25HJyjRGgJ4=
X-Google-Smtp-Source: AGHT+IFYPpmEMk0KFhlTbaqHeWEFWJ0uZm/Xuv/BxVjNUrlN6WksxTy7iVYi1YRdDVtylOESgx2QlQ==
X-Received: by 2002:a5d:5f8f:0:b0:366:f50a:2061 with SMTP id ffacd0b85a97d-366f50a223amr7905774f8f.50.1719389181052;
        Wed, 26 Jun 2024 01:06:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366388c40c3sm15083853f8f.30.2024.06.26.01.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 01:06:20 -0700 (PDT)
Message-ID: <c15045b4-2e5f-4fcc-b25c-76a5e4973e93@linaro.org>
Date: Wed, 26 Jun 2024 10:06:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: i3c: dw: Add property to select IBI ops
To: Jeremy Kerr <jk@codeconstruct.com.au>, Aniket <aniketmaurya@google.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Joel Stanley <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240626052238.1577580-1-aniketmaurya@google.com>
 <20240626052238.1577580-2-aniketmaurya@google.com>
 <e28ba03d1df1c0c5aec987411c40e44fc351ce0d.camel@codeconstruct.com.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <e28ba03d1df1c0c5aec987411c40e44fc351ce0d.camel@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_010624_765409_41B460C7 
X-CRM114-Status: GOOD (  13.04  )
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

T24gMjYvMDYvMjAyNCAwNzozMSwgSmVyZW15IEtlcnIgd3JvdGU6Cj4gSGkgQW5pa2V0LAo+IAo+
PiBVc2UgdGhpcyBwcm9wZXJ0eSB0byBzZWxlY3QgSUJJIHJlbGF0ZWQgb3BzIGluIHRoZSBiYXNl
IHBsYXRmb3JtCj4+IGRyaXZlci4gT3RoZXJ3aXNlIHRoZSBkcml2ZXIgZGVmYXVsdHMgdG8gcmV0
dXJuIEVJTlZBTCBmb3IgYW55IElCSQo+PiByZXF1ZXN0cy4KPiAKPiBbLi4uXQo+IAo+PiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL3NucHMsZHctaTNjLW1hc3Rl
ci55YW1sCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2Mvc25w
cyxkdy1pM2MtbWFzdGVyLnlhbWwKPj4gQEAgLTI1LDYgKzI1LDEwIEBAIHByb3BlcnRpZXM6Cj4+
IMKgwqAgaW50ZXJydXB0czoKPj4gwqDCoMKgwqAgbWF4SXRlbXM6IDEKPj4gwqAKPj4gK8KgIGli
aS1jYXBhYmxlOgo+PiArwqDCoMKgIGRlc2NyaXB0aW9uOiBTZXQgdG8gc2VsZWN0IElCSSBvcHMu
CgpXaGF0IGFyZSBJQkkgb3BzPyBTdGFuZGFyZCBmb3JtIGxldHRlcjoKCllvdSBkZXNjcmliZWQg
dGhlIGRlc2lyZWQgTGludXggZmVhdHVyZSBvciBiZWhhdmlvciwgbm90IHRoZSBhY3R1YWwKaGFy
ZHdhcmUuIFRoZSBiaW5kaW5ncyBhcmUgYWJvdXQgdGhlIGxhdHRlciwgc28gaW5zdGVhZCB5b3Ug
bmVlZCB0bwpyZXBocmFzZSB0aGUgcHJvcGVydHkgYW5kIGl0cyBkZXNjcmlwdGlvbiB0byBtYXRj
aCBhY3R1YWwgaGFyZHdhcmUKY2FwYWJpbGl0aWVzL2ZlYXR1cmVzL2NvbmZpZ3VyYXRpb24gZXRj
LgoKPj4gK8KgwqDCoCB0eXBlOiBib29sZWFuCj4+ICsKPiAKPiBXb3VsZG4ndCB0aGUgY29tcGF0
aWJsZSBzdHJpbmcgc2VsZWN0IHdoZXRoZXIgdGhlIGhhcmR3YXJlIGluc3RhbmNlCj4gc3VwcG9y
dHMgSUJJIG9yIG5vdD8KPiAKPiBJJ2QgaW1hZ2luZSB0aGF0IGVhY2ggc3BlY2lmaWMgc3ludGhl
c2lzIG9mIHRoZSBEVyBJUCB3b3VsZCBpbXBseQo+IGNvcnJlc3BvbmRpbmcgaGFyZHdhcmUgc2V0
dGluZ3MsIGFuZCBzbyB3b3VsZCB3YXJyYW50IGl0cyBvd24gY29tcGF0aWJsZQo+IHZhbHVlLgo+
IAo+IE1heWJlIG9uZSBmb3IgdGhlIERUIGZvbGtzOiB3b3VsZCB0aGlzIHdvcmsgYmV0dGVyIGFz
IGluZGl2aWR1YWwKPiBwcm9wZXJ0aWVzPyBJcyB0aGVyZSBhIHBvbGljeSBoZXJlPwoKVXN1YWxs
eSBpZiBmZWF0dXJlIGlzIHNwZWNpZmljIHRvIGdpdmVuIGhhcmR3YXJlLCBlLmcuIGFsd2F5cyBj
YXBhYmxlIG9mCmZvb2JhciwgdGhlbiBpdCBjYW4gYmUgZGVkdWNlZCBmcm9tIGNvbXBhdGlibGUs
IHNvIG5vIG5lZWQgZm9yIG5ldyBwcm9wZXJ0eS4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoK
LS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
