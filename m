Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2A9C44507
	for <linux-i3c@archiver.kernel.org>; Fri, 17 Jul 2026 04:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z0YnSzfQwH0ttUvM6RmfTp2Z8kWjkNXj7NJGqBNUpuU=; b=byLLMqhsAF6O/u
	TW1e/qQUcSvg0kRFagvGA7eCaNa+UJBldoikz6QCVOMBu7Fnm+GKfRcibxZT3YoJ9zYIxTOnOqgwk
	u4ZeEE8CCMYftqJphZoweMNsiUTHmKmoJU7HSi19YX+5o/INPJU1Ypbutr1zXRRYijX7x8HCkTxd+
	0aopJDlsut5/6t9mrh6e+p21FL8c7rPjbuZJAjt0anl+LG+osB0Aj+/ufbQEnNZea4DvDDOjgdX7Y
	pYiuM8MFj60hzvlso8XjJc8NvxCnsNBKrUYJWmxLe0EU4G2dka1vb3inzsHQhtxo/cW8iv8Tq7zlZ
	O6OYf5OGgRTvV1wA8oaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkZkx-00000001666-1IZo;
	Fri, 17 Jul 2026 04:00:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkZkw-0000000165g-11hC
	for linux-i3c@lists.infradead.org;
	Fri, 17 Jul 2026 04:00:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2550060A5E;
	Fri, 17 Jul 2026 04:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA971F000E9;
	Fri, 17 Jul 2026 04:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784260856;
	bh=PwOkEy8C3+8zcielTkx4YVyJzWQmV+QDjPL3dA5zhL8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oGDGmGcjXIaBSQhsBTXBCkaQ96uPaETinbUeOASHOBgUHTf5xBhKAN70wuaDhIS6P
	 vGwKXLcgv9IiXuMuGfElPzEpP+gIdTEzxh235a3m4tbT7d2eItp/N9R72lBSds+LRv
	 0uQ4R5Jbpeq7hzjntzmpdzw4qCk/YSuD/ui0mvQkL90PUPkVXFaY1cf4BOemocSMZK
	 Gur3IoMT8t+V+pbYMEQ+JWdu/kIcn+nm/3Owz0XzhILAG5Y6k5tReuniGsVX+W1Fqz
	 xs32m82p1mjG/ieAxln+h9/fwZ+HHYcwEHOSumSx6jRa1UMckuMuRO8DgsS29sVuj5
	 y5oZ5riGuLxxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/8] dt-bindings: gpio: cdns: add Axiado AX3005 GPIO
 variant
To: "Swark Yang" <syang@axiado.com>
Cc: linux-i3c@lists.infradead.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260716-upstream-axiado-ax3005-upstream-v3-2-c429095143ec@axiado.com>
References: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
 <20260716-upstream-axiado-ax3005-upstream-v3-2-c429095143ec@axiado.com>
Date: Fri, 17 Jul 2026 04:00:55 +0000
Message-Id: <20260717040056.6BA971F000E9@smtp.kernel.org>
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

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFRoZSBzY2hlbWEgZW5m
b3JjZXMgYSAzLWl0ZW0gY29tcGF0aWJsZSBzdHJpbmcgY2hhaW4gdGhhdCB1bmludGVudGlvbmFs
bHkgZm9yY2VzIEFYMzAwNSBkZXZpY2VzIHRvIGluaGVyaXQgYW4gQVgzMDAwLXNwZWNpZmljIGRy
aXZlciBxdWlyaywgY29udHJhZGljdGluZyB0aGUgY29tbWl0IG1lc3NhZ2UuCi0tCgotLS0gUGF0
Y2ggWzJdOiBbUEFUQ0ggdjMgMi84XSBkdC1iaW5kaW5nczogZ3BpbzogY2RuczogYWRkIEF4aWFk
byBBWDMwMDUgR1BJTyB2YXJpYW50IC0tLQpjb21taXQgNTNjNjdlN2RjNDYwOWVlOWU2MWY1N2Ex
ZDQzYzljNmNhMDRkMTIzYgpBdXRob3I6IFN3YXJrIFlhbmcgPHN5YW5nQGF4aWFkby5jb20+Cgpk
dC1iaW5kaW5nczogZ3BpbzogY2RuczogYWRkIEF4aWFkbyBBWDMwMDUgR1BJTyB2YXJpYW50CgpB
ZGQgYmluZGluZyBmb3IgdGhlIEF4aWFkbyBBWDMwMDUgR1BJTyBjb250cm9sbGVyLiBUaGUgY29t
bWl0IG1lc3NhZ2Ugc3RhdGVzCnRoZXJlIGFyZSBubyBrbm93biBjaGFuZ2VzIGFuZCBpdCBzaG91
bGQgZmFsbCBiYWNrIGRpcmVjdGx5IHRvIHRoZQpjZG5zLGdwaW8tcjFwMDIgY29tcGF0aWJsZSBz
dHJpbmcuCgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
Z3Bpby9jZG5zLGdwaW8ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9n
cGlvL2NkbnMsZ3Bpby55YW1sCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2dwaW8vY2RucyxncGlvLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZ3Bpby9jZG5zLGdwaW8ueWFtbAo+IEBAIC0xNCw4ICsxNCwxMSBAQCBwcm9wZXJ0
aWVzOgo+ICAgICAgb25lT2Y6Cj4gICAgICAgIC0gY29uc3Q6IGNkbnMsZ3Bpby1yMXAwMgo+ICAg
ICAgICAtIGl0ZW1zOgo+IC0gICAgICAgICAgLSBlbnVtOgo+IC0gICAgICAgICAgICAgIC0gYXhp
YWRvLGF4MzAwMC1ncGlvCj4gKyAgICAgICAgICAtIGNvbnN0OiBheGlhZG8sYXgzMDAwLWdwaW8K
PiArICAgICAgICAgIC0gY29uc3Q6IGNkbnMsZ3Bpby1yMXAwMgo+ICsgICAgICAtIGl0ZW1zOgo+
ICsgICAgICAgICAgLSBjb25zdDogYXhpYWRvLGF4MzAwNS1ncGlvCj4gKyAgICAgICAgICAtIGNv
bnN0OiBheGlhZG8sYXgzMDAwLWdwaW8KPiAgICAgICAgICAgIC0gY29uc3Q6IGNkbnMsZ3Bpby1y
MXAwMgoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIGZvcmNpbmcgYXhpYWRvLGF4MzAwMC1ncGlvIGlu
dG8gdGhlIDMtaXRlbSBjb21wYXRpYmxlIHN0cmluZyBjaGFpbgp1bmludGVudGlvbmFsbHkgY2F1
c2UgQVgzMDA1IGRldmljZXMgdG8gaW5oZXJpdCBBWDMwMDAtc3BlY2lmaWMgZHJpdmVyCnF1aXJr
cz8KCkJ5IHJlcXVpcmluZyB0aGUgYXhpYWRvLGF4MzAwMC1ncGlvIGNvbXBhdGlibGUgc3RyaW5n
IGluIHRoZSBmYWxsYmFjayBjaGFpbiwKYW55IEFYMzAwNSBkZXZpY2UgdHJlZSBtdXN0IGluY2x1
ZGUgaXQgdG8gcGFzcyBzY2hlbWEgdmFsaWRhdGlvbi4gVGhlCnVuZGVybHlpbmcgZHJpdmVyIHdp
bGwgdGhlbiBtYXRjaCB0aGlzIGludGVybWVkaWF0ZSBzdHJpbmcgdmlhCmRldmljZV9nZXRfbWF0
Y2hfZGF0YSgpIGFuZCBhcHBseSBheDMwMDBfZ3Bpb19xdWlya3MsIHN1Y2ggYXMgc2tpcHBpbmcK
aW5pdGlhbGl6YXRpb24gb2YgQ0ROU19HUElPX0RJUkVDVElPTl9NT0RFIGFuZCBDRE5TX0dQSU9f
T1VUUFVUX0VOLgoKVGhlIGNvbW1pdCBtZXNzYWdlIHN0YXRlcyB0aGUgaW50ZW50IGlzIHRvIGZh
bGwgYmFjayB0byB0aGUgY2RucyxncGlvLXIxcDAyCmNvbXBhdGlibGUuIFNob3VsZCBheGlhZG8s
YXgzMDA1LWdwaW8gaW5zdGVhZCBiZSBhZGRlZCB0byBhbiBlbnVtIGFsb25nc2lkZQpheGlhZG8s
YXgzMDAwLWdwaW8gaW4gYSAyLWl0ZW0gZmFsbGJhY2sgY2hhaW4sIGF2b2lkaW5nIHRoZSBpbnRl
cm1lZGlhdGUKQVgzMDAwIHN0cmluZyBlbnRpcmVseT8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDC
tyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA3MTYtdXBzdHJlYW0tYXhpYWRv
LWF4MzAwNS11cHN0cmVhbS12My0wLWM0MjkwOTUxNDNlY0BheGlhZG8uY29tP3BhcnQ9MgoKLS0g
CmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
